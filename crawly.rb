require "json"
require "pry"
require "anemone"


class Target
  def initialize(t)
    @t = t
  end
end

Dir.glob("./json/*.json")  do |filename| #everyfile that looks like *.json, passing the match and naming it file

	readFile = File.read(filename) #open json files

	parsedFile = JSON.parse(readFile) #parse file into mapObj

	puts parsedFile['program_name']
	puts "----"

	parsedFile['scope'].each do |h|
		if ( h['DnsRecord'] != "" && h['scope'] == "include" ) #Included DNS record in each json file
		dns_record_include =  h['DnsRecord'] #ass
	end
class DnsRecordTarget < Target

  def crawl

		igning to var

		  uri = "https://#{@t["dns_record_include"]}" if @t["dns_record_include"]
				Anemone.crawl(uri) do |anemone|
					anemone.on_every_page do |page|
						puts page.url
						##CRAWLY!!!!##
						if page.code == 301; puts "301 - Redirecting"; end
						if page.code == 400; puts "400 - Bad Request"; end
						if page.code == 404; puts "404 - 4 OH 4"; end

					end
				end
			end
	end
end
end

x.targets.each {|t| t.crawl}
