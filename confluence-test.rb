require 'confluencer'
require 'confluence4r'

begin
  #login
  user = 'di.sheng'
  password = 'Di880817'
  client = Confluence::Client.new(url: "https://cyb3rk4lk1pil0t.atlassian.net/wiki/")
  client.login(user,password)

  
page = {
  "space" => "TP1",
  "title" => "This is my new 123 page",
  "content" => "Hello, Confluence world!"
}
 puts client.storePage(page)

  # no need to save resulting token; api handles it

  # get all spaces
  # => [{'url', 'name', 'key', 'type'}]
 p "----------------------------------------"
  # get specific space by space key
  # => {'url', 'name', 'key', 'type', 'homepage'}
  p "----------------------------------------"

  # get pages from a space by using space key
  

p "----------------------------------------"
  # get page by page id

#ps = client.get_page("LOL", "This is my new 12 page")
#p ps


rescue Exception => e
  puts "error: " + e.to_s
end