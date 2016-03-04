require 'confluence4r'
 
confluence = Confluence::RPC.new("https://cyb3rk4lk1pil0t.atlassian.net/wiki")
confluence.login("di.sheng", "Di880817")
# puts confluence.getSpaces()
 
# Create a new page (works)
 
page = {
  "space" => "LOL",
  "title" => "This is my new 31 page",
  "content" => "Hello, Confluence world!"
}
 
#puts confluence.storePage(page)
 
# Modify an existing page
 
pageToUpdate = confluence.getPage("LOL", "This is my new 2 page")
pageToUpdate.content = "Now the page is updated"
 
puts confluence.updatePage(pageToUpdate)
 
# Remove a page
 
#confluence.removePage(page.id)