require 'json'
require 'net/smtp'
require 'date'
require 'net/imap'

        @info =  `curl http://192.168.122.1:3000/api/v1/emails/#`
        @info = JSON.parse(@info).to_a



        @info.each do |server_name,imap,imap_port,smtp,smtp_port,account_name,account_password|
            message = DateTime.now.to_s
            smtp = Net::SMTP.new(smtp,smtp_port,)
            p smtp.inspect
            smtp.enable_starttls
            smtp.start(server_name.downcase,account_name,account_password,:login) do
                if server_name.downcase = 'outlook.com'
                   reveiver = 'tester.kalki@gmail.com'
                else
                   reveiver = 'tester.kalki@hotmail.com'
                end
                smtp.send_message(message, account_name, receiver)
                p smtp.inspect
                smtp.finish
            end
        end










#ping test (works well)
=begin
require 'net/ping'
while true do
    @icmp = Net::Ping::ICMP.new('65.206.95.146')
    rtary = []
    pingfails = 0
    repeat = 5
    puts 'starting to ping'
    (1..repeat).each do

        if @icmp.ping
            rtary << @icmp.duration
            puts "host replied in #{@icmp.duration}"
        else
            pingfails += 1
            puts "timeout"
        end
    end
    if repeat == pingfails
        puts "fail to connect"
    else
        avg = rtary.inject(0) {|sum, i| sum + i}/(repeat - pingfails)
        avg = avg*1000
        avg = avg.round(3)
        puts "Average round-trip is #{avg}\n"
        puts`curl -v -XPATCH http://localhost:3000/sites/5 -d "site[ping]=#{avg}"`
    end
    sleep 20
end

=end