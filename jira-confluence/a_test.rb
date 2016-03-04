
require 'json'
require 'time'
#require 'confluence4r'
require 'net/ping'

#local config
#_________________________________________________

user='di.sheng'
password = 'Di880817'
wiki_url = 'https://cyb3rk4lk1pil0t.atlassian.net/wiki/'
space_key = "DEMO"
page_title = "Daily report for ping"
rails_host = 'localhost'

#_________________________________________________

class Ping_test

    def initialize(repetition, host) #may include file_name if want to fetch from local txt file
      #  @file_name = file_name
        @repetition = repetition
        @host_server=host
        @ip = self.get_id_ip_hash
    end

    def get_id_ip_hash
        count =  `curl http://#{@host_server}:3000/api/v1/sites/#`
        count = JSON.parse(count).to_a
        return count

    end

=begin

    def get_id_ip_hash()        #initialize id&ip hash table
        ip = Hash.new
        File.foreach(@file_name).with_index do |line, line_num|

            match = line.match(/\d{1,3}\.\d{1,3}\.\d{1,3}\.\d{1,3}/).to_s
             if match!= nil && match !=""
                id = line.match(/\s+\d+\s*/).to_s.chomp.delete!(" ")    #get rid of any white space
                ip[id]=match                                            #create hash ip. e.g. ip[2]=192.158.2.12
            end
        end
        return ip
    end
=end

    def ping_test
        @ip.each do |id, ip, a,c,e,d|
            @icmp = Net::Ping::ICMP.new(ip)
            rtary = []
            pingfails = 0
            puts 'starting to ping'
            (1..@repetition).each do
                        if @icmp.ping
                            rtary << @icmp.duration
                            puts "#{ip} replied in #{@icmp.duration}"
                        else
                            pingfails += 1
                            puts "timeout"
                        end
            end
            if @repetition == pingfails
                puts`curl -v -XPATCH http://#{@host_server}:3000/sites/#{id} -d "site[ping]=-1"`
            else
                avg = rtary.inject(0) {|sum, i| sum + i}/(@repetition - pingfails)
                avg = avg*1000
                avg = avg.round(3)
                puts "Average round-trip is #{avg}\n"
                puts`curl -v -XPATCH http://#{@host_server}:3000/sites/#{id} -d "site[ping]=#{avg}"`

            end
        end
    end

    def auto_run_script

            self.ping_test
            sleep 10
            @ip = self.get_id_ip_hash
 

    end

end

test=Ping_test.new(5,rails_host)
while true
	test.auto_run_script
	
end


