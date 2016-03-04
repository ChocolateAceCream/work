require 'rubygems'
require 'pp'
require 'jira'
require 'date'

# Consider the use of :use_ssl and :ssl_verify_mode options if running locally
# for tests.

username = 'dsheng'
password = "*Di880817"

options = {
            :username => username,
            :password => password,
            :site     => 'https://kalkiconsulting.atlassian.net/',
            :context_path => '',
            :auth_type => :basic,
            :read_timeout => 120
          }

client = JIRA::Client.new(options)


issue = client.Issue.find("16971")
p issue


=begin
project = client.Project.find('COOITM')
p 1
# Show all projects
project.issues.each do |issue|
puts "#{issue.id} - #{issue.fields['summary']}"
    end

=begin
@num=100
date = Date.today
2.times do
issue = client.Issue.build
issue.save({"fields"=>{"summary"=>"#{date} sample task numbet #{@num}","project"=>{"key"=>"DAIL"},"issuetype"=>{"name"=>"IT Help"}}})
issue.fetch
@num+=1
# pp issue
end
=end
