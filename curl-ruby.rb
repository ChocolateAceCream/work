require 'rubygems'
require 'net/http'
require 'json'
 
jira_url = "http://cyb3rk4lk1pil0t.atlassian.net/rest/api/latest/issue/"
#issue_keys = %w[AE-1 AE-2 AE-3]
json_ext = ".json"
auth = "di.sheng:Di880817 "
 username = 'di.sheng'
 password = 'Di880817'


for issue in issue_keys
    uri = URI.parse(jira_url+issue)
    response = Net::HTTP::Get.new(uri.request_uri)
    response.basic_auth username, password
    response["Content-Type"] = "application/json"
 
 #   if response.code =~ /20[0-9]{1}/
        data = JSON.parse(response.body)
        fields = data.keys
 
        puts "Output for issue " + issu
e     
        puts "issue reporter: "
        puts data["fields"]["reporter"]["value"].values[0]
 
        puts "issue summary: "
        puts data["fields"]["summary"].values[1]
 
        puts "issue description: "
        puts data["fields"]["description"].values[1]
 
        #uncomment the two lines below to see a prettified version of the json
        #puts "Here is prettified JSON data: "
        #puts JSON.pretty_generate(data)
        #
        puts "\n"#extra line feed for readability
  #  else
   #  raise StandardError, "Unsuccessful response code " + response.code + " for issue " + issue
   # end
end