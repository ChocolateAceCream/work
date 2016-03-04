require 'json'
count =  `curl -u di.sheng:Di880817 https://cyb3rk4lk1pil0t.atlassian.net/rest/api/latest/issue/SD-1.json`
count= JSON.parse(count)
count
p count



 
