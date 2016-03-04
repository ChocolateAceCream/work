require 'confluencer'
#require 'confluence4r'
require 'net/ping'
require 'json'
require 'time'


#local config
#_________________________________________________

user='di.sheng'
password = 'Di880817'
wiki_url = 'https://cyb3rk4lk1pil0t.atlassian.net/wiki/'
space_key = "DEMO"
page_title = "Daily report for ping"
rails_host = 'localhost'

#_________________________________________________


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
		while true
			self.update_confluence
			sleep 10
		end
	end
end



#auto run
#_________________________________________________________

ping = Update_ping.new(user,password,wiki_url,space_key,page_title,rails_host)
ping.auto_run_script

#_________________________________________________________

=begin
begin
  #login
     def update_confluence
          user = 'di.sheng'
  password = 'Di880817'
  client = Confluence::Client.new(url: "https://cyb3rk4lk1pil0t.atlassian.net/wiki/")
  client.login(user,password)
  ps=client.get_page("DEMO", "Daily report")
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





count =  `curl http://localhost:3000/api/v1/sites/#`
count = JSON.parse(count).to_a


p @content
  ps["content"]=@content

  client.storePage(ps)
    end

rescue Exception => e
  puts "error: " + e.to_s
end


10.times do
	update_confluence
	sleep 4
end
=end