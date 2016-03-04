require 'rubygems'
require 'pp'
require 'jira'
require 'date'
require 'confluencer'
require 'confluence4r'
require 'time'

# Consider the use of :use_ssl and :ssl_verify_mode options if running locally
# for tests.

username = "di.sheng"
password = "Di880817"

options = {
            :username => username,
            :password => password,
            :site     => 'https://cyb3rk4lk1pil0t.atlassian.net/',
            :context_path => '',
            :auth_type => :basic,
            :read_timeout => 120
          }
loop do
client = JIRA::Client.new(options)
p 1

# Show all projects
projects = client.Project.all
p 2

projects.each do |project|
  puts "Project -> id: #{project.id}, name: #{project.name}"
end
@time=Time.now
date = Date.today

issue = client.Issue.build
issue.save({"fields"=>{"summary"=>"#{date} sample task at #{@time}","project"=>{"key"=>"DAIL"},"issuetype"=>{"name"=>"IT Help"}}})
issue.fetch



begin
  #login
  user = 'di.sheng'
  password = 'Di880817'
  client = Confluence::Client.new(url: "https://cyb3rk4lk1pil0t.atlassian.net/wiki/")
  client.login(user,password)
  # no need to save resulting token; api handles it

  # get all spaces
 # p all_spaces = client.get_spaces
  # => [{'url', 'name', 'key', 'type'}]
 p "----------------------------------------"
  # get specific space
#  p test_space = client.get_space( "TP1")
  # => {'url', 'name', 'key', 'type', 'homepage'}
  p "----------------------------------------"

  # get pages from a space by using space key
#  ps = client.get_pages("TP1")
# p ps
p "----------------------------------------"

=begin
=end
page = {
  "space" => "DEMO",
  "title" => "#{@time} daily report",
  "content" => '<ac:structured-macro ac:name="jira">
  <ac:parameter ac:name="columns">key,summary,type,created,assignee,status</ac:parameter>
  <ac:parameter ac:name="server">Atlassian JIRA</ac:parameter>
  <ac:parameter ac:name="serverId">d125c99d-4811-3a20-9f4a-71500b512f4f</ac:parameter>
    <ac:parameter ac:name="jqlQuery">project = DAIL AND issuetype = "IT Help" AND resolution = Unresolved ORDER BY priority DESC, updated DESC</ac:parameter>
  </ac:structured-macro>'
}
p client.storePage(page)
p "----------------------------------------"

p "-------------------------------------fff---"

rescue Exception => e
  puts "error: " + e.to_s
end

sleep 60
# pp issue
end