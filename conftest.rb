require 'confluencer'
require 'confluence4r'
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
 ps = client.get_pages("DEMO")
 p ps
p "----------------------------------------"

=begin
page = {
  "space" => "TP1",
  "title" => "This is my new 222 page",
  "content" => "Hello, Confluence world!"
}
p client.storePage(page)
p "----------------------------------------"

=end

p ps=client.get_page("DEMO", "Daily report")
p "----------------------------------------"
p ps["content"] += '<ac:structured-macro ac:name="jira">
  <ac:parameter ac:name="columns">key,summary,type,created,assignee,status</ac:parameter>
  <ac:parameter ac:name="server">Atlassian JIRA</ac:parameter>
  <ac:parameter ac:name="serverId">d125c99d-4811-3a20-9f4a-71500b512f4f</ac:parameter>
    <ac:parameter ac:name="jqlQuery">project = LOL</ac:parameter>
  </ac:structured-macro>'
p "-------------------------------------fff---"

  
  #update a page
  npage = client.storePage(ps)
  # => {'id', 'current', 'content', 'title', 'version', 'modifier',
  #     'url', 'homePage', 'creator', 'contentStatus', 'modified',
  #     'created', 'space', 'parentId', 'permissions'}
  # if "yapage29" exists, throws {Confluence::Error}Could not save or update record

rescue Exception => e
  puts "error: " + e.to_s
end