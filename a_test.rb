require 'confluencer'
require 'net/ping'
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

class Update_ping
	def initialize(user, password,wiki_url,space_key,page_title,rails_host)
		@user = user
		@password = password
		@url = wiki_url	
		@space_key = space_key
		@page_title = page_title
		@rails_host = rails_host
	end

	def get_content
		@content = '<ac:structured-macro ac:name="toc">
    				<ac:parameter ac:name="width">100px</ac:parameter>
  					<ac:rich-text-body>
    				<p>This is the content of <strong>column 1</strong>.</p>
  					</ac:rich-text-body>
  					</ac:structured-macro>
					  <table>
					    <tbody>
					            <tr>
					            <th>
					                Site Name
					            </th>
					            <th>
					                Site ID
					            </th>
					            <th>
					                Description
					            </th>
					            <th>
					                Ping(ms)
					            </th>
					            <th>
					                ip
					            </th>
					            <th>
					                Updated at
					            </th>
        						</tr>'
		json =  `curl http://#{@rails_host}:3000/api/v1/sites/#`
		json = JSON.parse(json).to_a
		json.each do |id, ip, name, description, update, ping|
		    update=Time.parse(update)
		    update = update + Time.zone_offset('EST')
		    update.strftime('%d-%m-%Y %R') 
		    update=update.to_s.gsub(/UTC/, 'EST')

		    @content += "
		    <tr>
		            <th>
		                #{name}
		            </th>
		            <th>
		                #{id}
		            </th>
		            <th>
		                #{description}
		            </th>
		            <th>
		                #{ping}
		            </th>
		            <th>
		                #{ip}
		            </th>
		            <th>
		                #{update}
		            </th>            
		        </tr>
		        "
		end
		@content+='</tbody></table>'
		return @content
	end

	def update_confluence
		begin
			#login
			client = Confluence::Client.new(url: @url)
			client.login(@user,@password)
			page=client.get_page(@space_key, @page_title) # get page using params
			page["content"] = self.get_content			  #update old content
			client.storePage(page)						  #upload new page

		rescue Exception => e
		  puts "error: " + e.to_s
		end
	end

	def auto_run_script

			self.update_confluence
			sleep 10

	end
end


test=Ping_test.new(5,rails_host)
ping = Update_ping.new(user,password,wiki_url,space_key,page_title,rails_host)
while true
	ping.auto_run_script
	test.auto_run_script
end


