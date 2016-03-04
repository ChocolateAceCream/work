require 'net/imap'
require 'date'
require 'time'
# mostly written by Al Alexander, http://DevDaily.com
# (okay, okay, i copied a lot of it and glued it together)

# ==========
# IMAP FLAGS
# ==========
# BEFORE <date>:  8-Aug-2002.
# BODY <string>:
# CC <string>:
# FROM <string>:
# NEW:  messages with the \Recent, but not the \Seen, flag set.
# NOT <search-key>:
# OR <search-key> <search-key>: "or" two search keys together.
# ON <date>:
# SINCE <date>:
# SUBJECT <string>:
# TO <string>:

# ===============
# ENVELOPE FIELDS
# ===============
# date:
# subject:
# from:     an array of Net::IMAP::Address
# sender:   an array of Net::IMAP::Address
# reply_to: an array of Net::IMAP::Address
# to:       an array of Net::IMAP::Address
# cc:       an array of Net::IMAP::Address
# bcc:      an array of Net::IMAP::Address

# ==============
# ADDRESS FIELDS
# ==============

# name:
# route:
# mailbox:
# host:

server = "imap.mail.yahoo.com"    # change this for your system
user = "tester.kalki@yahoo.co.uk"        # change this for your system
pass = "foobar123"        # change this for your system
#folder = "INBOX.Sent"      # shows how to specify a different folder
folder = "INBOX"
today = Net::IMAP.format_datetime(Date.today)
imap = Net::IMAP.new(server, {:port => '993', :ssl => true })
imap.login(user, pass)
imap.select(folder)
time =time
# "SINCE", "1-Apr-2003"
#imap.search(["FROM", "ann", "NOT", "NEW", "SINCE", "1-Apr-2003",
#             "BODY", "tree"]).each do |msg_id|
#imap.search(["TO", "reggie", "BODY", "vacation"]).each do |msg_id|

  imap.search(["FROM", "tester.kalki@gmail.com", "SUBJECT", "2016-02-11 17:35:37 -0500"]).each do |msg_id|
  p send_time = imap.fetch(msg_id, "ENVELOPE")[0].attr["ENVELOPE"].subject
  msg = imap.fetch(msg_id, "(UID RFC822.SIZE ENVELOPE INTERNALDATE)")[0]
  receive_time = msg.attr["INTERNALDATE"]
  p receive_time.class
  send_time = Time.parse(send_time)
  receive_time = Time.parse(receive_time)
  puts "time is send_time #{send_time}"
  puts " this is receive_time #{receive_time}"
  delay = send_time-receive_time
  p 1
  puts "delay is #{delay}"
  #envelope = msg.attr["ENVELOPE"]
  #uid = msg.attr["UID"]
  #size = msg.attr["RFC822.SIZE"]
  #puts "To: #{to}"
  p 2
imap.logout
imap.disconnect


end