require 'rubygems'
require 'pp'
require 'jira'
require 'date'

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

client = JIRA::Client.new(options)
p '-----------------------------'
# Show all projects
p projects = client.Project.all.first
p '-----------------------------'

=begin
projects.each do |project|
  puts "Project -> id: #{project.id}, name: #{project.name}"
end
@num=1
date = Date.today
2.times do
issue = client.Issue.build
issue.save({"fields"=>{"summary"=>"#{date} sample task numbet #{@num}","project"=>{"key"=>"DEMO"},"issuetype"=>{"name"=>"IT Help"}}})
issue.fetch
# pp issue
end
=end