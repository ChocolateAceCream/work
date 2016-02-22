require 'time'

time = Time.parse("2016-02-17T19:48:51.161Z")
time = time + Time.zone_offset('EST')
time.strftime('%d-%m-%Y %R') 
p time.to_s.gsub(/UTC/, 'EST')
