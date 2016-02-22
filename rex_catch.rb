ip = Hash.new
File.foreach('ip.txt').with_index do |line, line_num|
   
	match = line.match(/\d{1,3}\.\d{1,3}\.\d{1,3}\.\d{1,3}/).to_s
	
  	if match!= nil && match !=""
   		id = line.match(/\s+\d+\s*/).to_s.chomp.delete!(" ")	#get rid of any white space
   		ip[id]=match											#create hash ip. e.g. ip[2]=192.158.2.12
   	end
end
p ip