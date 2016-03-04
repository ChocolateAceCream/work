require 'net/smtp'
require 'time'
time = Time.now
msg = "Subject: #{time}\n\nThis works, and this part is in the body."

smtp = Net::SMTP.new 'smtp.gmail.com', 587
  p smtp.inspect
 smtp.enable_starttls
 smtp.start('gmail.com','tester.kalki@gmail.com','foobar123',:login) do
  #10.times do
      smtp.send_message(msg, 'tester.kalki@gmail.com','tester.kalki@hotmail.com')
  #end
  p smtp.inspect
   smtp.finish
end

smtp = Net::SMTP.new 'smtp.live.com', 587
  p smtp.inspect
 smtp.enable_starttls
 smtp.start('hotmail.com','tester.kalki@hotmail.com','foobar123',:login) do
  #10.times do
      smtp.send_message(msg, 'tester.kalki@hotmail.com','tester.kalki@gmail.com')
  #end
  p smtp.inspect
   smtp.finish
end
