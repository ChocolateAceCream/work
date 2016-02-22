


# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

User.create!(name:  "Admin",
             email: "Admin@kalki.com",
             password:              "foobar",
             password_confirmation: "foobar",
             admin:     true,
             activated: true,
             activated_at: Time.zone.now)

10.times do |n|
    name  = "User#{n+1}"
    email = "User#{n+1}@kalki.com"
    password = "password"
    User.create!(name:  name,
                 email: email,
                 password:              password,
                 password_confirmation: password,
                 activated: true,
                 activated_at: Time.zone.now)
end

10.times do |n|
    name = 'Google'
    description = "none"
    ping = 0
    ip = "72.14.192.#{n}"
    Site.create!(name: name,
                 description: description,
                 ping:       ping,
                 ip:     ip)
end

Email.create!(  server_name: "hotmail.com",
                imap:   "imap-mail.outlook.com",
                imap_port: 993,  
                smtp:   "smtp.live.com",
                smtp_port: 587,
                account_name: "tester.kalki@hotmail.com",
                account_password: "foobar123"
              )

Email.create!(  server_name: "gmail.com",
                imap:   "imap.gmail.com",
                imap_port: 993,
                smtp:   "smtp.gmail.com",
                smtp_port: 587,
                account_name: "tester.kalki@gmail.com",
                account_password: "foobar123"
              )