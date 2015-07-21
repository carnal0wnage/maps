require "json"
require "pry"
require "intrigue"
require "ap"

Dir.glob("./json/*.json")  do |filename| #everyfile that looks like *.json, passing the match and naming it file
	readFile = File.read(filename)
	#parse file into mapObj
	parsedFile = JSON.parse(readFile)
	#puts parsedFile['program_uri']
	parsedFile['scope'].each do |h|

	# ----- INTRIGUE INIT ------
		x=Intrigue.new #ingtrigue API
		options_list = []
		options = [
			{
				:name=>"use_file",
				:value=> true
			}
		]
	#--------------------------

	if ( h['DnsRecord']!="" && h['scope'] == "include" )
		dns_record_include =  h['DnsRecord']

		entity = {
			:type => "DnsRecord",
			:attributes => { :name => dns_record_include} #Required for intrigue
	  	}

		r = x.start "dns_brute_sub", entity, options_list
		ap r

		end
	end
end
