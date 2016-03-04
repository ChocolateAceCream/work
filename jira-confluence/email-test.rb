require 'net/smtp'
require 'date'
require 'time'
require 'net/imap'
require 'json'

class Check_email

    def initialize(host)
        @host_server = host
        @email_server_info = self.get_email_server_info # store in an array
    end

    def get_email_server_info
        p @host_server
        url = 'http://' + @host_server + ':3000/api/v1/emails/#'
        p url
        info =  `curl #{url}`
        info = JSON.parse(info).to_a
        return info

    end

    def send_mail_inspection
        @email_server_info.each do |id, server_name, imap,imap_port, smtp,smtp_port, account_name, account_password|

            @receiver_server_name = 'gmail.com'
            @receiver_account_name = 'tester.kalki@gmail.com'
            @receiver_account_password = 'foobar123'
            @receiver_imap = 'imap.gmail.com'
            @receiver_imap_port = 993

            if server_name.downcase == 'gmail.com'
                @receiver_server_name = 'hotmail.com'
                @receiver_account_name = 'tester.kalki@hotmail.com'
                @receiver_account_password = 'foobar123'
                @receiver_imap = 'imap-mail.outlook.com'
                @receiver_imap_port = 993
            end

            time = Time.now
            msg = "Subject: #{time}\n\n#{server_name}"
            smtp_receiver = Net::SMTP.new(smtp,smtp_port)
            p smtp_receiver.inspect
            smtp_receiver.enable_starttls

            smtp_receiver.start(server_name.downcase,account_name,account_password,:login) do
                smtp_receiver.send_message(msg, account_name, @receiver_account_name)
                p smtp_receiver.inspect
                smtp_receiver.finish
            end

            server = @receiver_imap    # change this for your system
            user = @receiver_account_name        # change this for your system
            pass = @receiver_account_password        # change this for your system
            #folder = "INBOX.Sent"      # shows how to specify a different folder
            folder = "INBOX"
            @delay = 0
            loop do
                imap = Net::IMAP.new(server, {:port => @receiver_imap_port, :ssl => true })
                imap.login(user, pass)
                imap.select(folder)
                imap.search(["FROM", account_name, "SUBJECT", time.to_s]).each do |msg_id|
                    send_time = imap.fetch(msg_id, "ENVELOPE")[0].attr["ENVELOPE"].subject
                    msg = imap.fetch(msg_id, "(UID RFC822.SIZE ENVELOPE INTERNALDATE)")[0]
                    receive_time = msg.attr["INTERNALDATE"]
                    p 1
                    p receive_time
                    send_time = Time.parse(send_time)
                    receive_time = Time.parse(receive_time)
                    puts "time is send_time #{send_time}"
                    puts " this is receive_time #{receive_time}"
                    @delay = receive_time-send_time
                    puts "delay is #{@delay}"
                    #envelope = msg.attr["ENVELOPE"]
                    #uid = msg.attr["UID"]
                    #size = msg.attr["RFC822.SIZE"]
                    #puts "To: #{to}"
                end
                break if @delay>0

                imap.logout
                imap.disconnect
                sleep 30
            end
            puts`curl -v -XPATCH http://#{@host_server}:3000/emails/#{id} -d "email[sending_time]=#{@delay}"`
        end
    end

    def receive_mail_inspection
        time = Time.now
        msg = "Subject: #{time}"
        @delay = 0
        gmail_account=[]
        other_account=[]

        @gmail_server_name = 'gmail.com'
        @gmail_account_name = 'tester.kalki@gmail.com'
        @gmail_account_password = 'foobar123'
        @gmail_smtp = 'smtp.gmail.com'
        @gmail_smtp_port = 587

        @hotmail_server_name = 'hotmail'
        @hotmail_account_name = 'tester.kalki@hotmail.com'
        @hotmail_account_password = 'foobar123'
        @hotmail_smtp = 'smtp.live.com'
        @hotmail_smtp_port = 587

        @email_server_info.each do |id, server_name, imap,imap_port, smtp,smtp_port, account_name, account_password|
            if server_name.downcase == 'gmail.com'
              p gmail_account.class
              p account_name
              p account_name.class
              gmail_account << account_name
            else
              other_account << account_name
            end
        end

        #For servers other than Gmail
        smtp_receiver = Net::SMTP.new(@gmail_smtp,@gmail_smtp_port)
            p smtp_receiver.inspect
            smtp_receiver.enable_starttls
            smtp_receiver.start(@gmail_server_name.downcase,@gmail_account_name,@gmail_account_password,:login) do
                smtp_receiver.send_message(msg, @gmail_account_name, other_account)
                p smtp_receiver.inspect
                smtp_receiver.finish
            end

        #For Gmail servers
        smtp_receiver = Net::SMTP.new(@hotmail_smtp,@hotmail_smtp_port)
            p smtp_receiver.inspect
            smtp_receiver.enable_starttls
            smtp_receiver.start(@hotmail_server_name.downcase,@hotmail_account_name,@hotmail_account_password,:login) do
                smtp_receiver.send_message(msg, @hotmail_account_name, gmail_account)
                p smtp_receiver.inspect
                smtp_receiver.finish
            end        

        @email_server_info.each do |id, server_name, imap,imap_port, smtp,smtp_port, account_name, account_password|
          folder = "INBOX"
          server= imap
          user = account_name        
          pass = account_password   

          if server_name.downcase == 'gmail.com'
              sender = @hotmail_account_name
          else
              sender = @gmail_account_name
          end

          loop do
                imap = Net::IMAP.new(server, {:port => imap_port, :ssl => true })
                imap.login(user, pass)
                imap.select(folder)
                imap.search(["FROM", sender, "SUBJECT", time.to_s]).each do |msg_id|
                    send_time = imap.fetch(msg_id, "ENVELOPE")[0].attr["ENVELOPE"].subject
                    msg = imap.fetch(msg_id, "(UID RFC822.SIZE ENVELOPE INTERNALDATE)")[0]
                    receive_time = msg.attr["INTERNALDATE"]
                    send_time = Time.parse(send_time)
                    receive_time = Time.parse(receive_time)
                    puts "time is send_time #{send_time}"
                    puts " this is receive_time #{receive_time}"
                    @delay = receive_time-send_time
                    puts "delay is #{@delay}"
                    #envelope = msg.attr["ENVELOPE"]
                    #uid = msg.attr["UID"]
                    #size = msg.attr["RFC822.SIZE"]
                    #puts "To: #{to}"
                end
                break if @delay>0

                imap.logout
                imap.disconnect
                sleep 30
          end  
          puts`curl -v -XPATCH http://#{@host_server}:3000/emails/#{id} -d "email[receiving_time]=#{@delay}"`  
        end      
    end
end

host='localhost'
test=Check_email.new(host)
while true
    test.send_mail_inspection
    test.receive_mail_inspection
    sleep 20
end
