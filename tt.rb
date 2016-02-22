require 'rubygems'
require 'jira'

# Consider the use of :use_ssl and :ssl_verify_mode options if running locally
# for tests.

username = "di.sheng"
password = "Di880817"

options = {
            :username => username,
            :password => password,
            :site     => 'http://cyb3rk4lk1pil0t.atlassian.net/',

          }

client = JIRA::Client.new(options)

# Show all projects
projects = client.Project.all

projects.each do |project|
  puts "Project -> key: #{project.key}, name: #{project.name}"
end