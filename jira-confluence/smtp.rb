require 'net/smtp'
require 'time'
time = Time.now
msg = "Subject: #{time}\n\nThis works, and this part is in the body."

smtp = Net::SMTP.new 'smtp.mail.yahoo.com', 587

  p smtp.inspect
 smtp.enable_starttls
 smtp.start('yahoo.com','tester.kalki@yahoo.com','foobar123',:login) do
  #10.times do
      smtp.send_message(msg, 'tester.kalki@yahoo.com','tester.kalki@gmail.com')
  #end
  p smtp.inspect
   smtp.finish
end
