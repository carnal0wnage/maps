require "json"
require "ap"

Dir.glob("./json/*.json")  do |filename| #everyfile that looks like *.json, passing the match and naming it file
		#puts filename #print the name
		#	open file
		readFile = File.read(filename)
		#parse file into mapObj
		parsedFile = JSON.parse(readFile)
		puts parsedFile['program_name']
		puts parsedFile['program_uri']
		puts parsedFile['reward_type']

		parsedFile['scope'].each do |h|
		if ( h['DnsRecord']!="" && h['scope'] == "include" )
			dns_record_include =  h['DnsRecord']
			puts "     #{dns_record_include}"  
			end

	end
puts "---------"
end
