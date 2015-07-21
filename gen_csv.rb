require 'JSON'

puts "Program Name, Uri, Reward, Low, High, # Websites, # Mobile, # Software "

Dir.glob("*.json").each do |f|

    begin
      json = JSON.parse(File.read(f))
    rescue JSON::ParserError
      puts "Syntax Error!"
      exit 1
    end

    out_string = ""
    out_string << "#{json['program_name']},"
    out_string << "#{json['program_uri']},"
    out_string << "#{json['reward_type']},"
    out_string << "#{json['reward_low']},"
    out_string << "#{json['reward_high']},"

    software_package = 0
    dns_record = 0
    mobile = 0
    json['scope'].each do |x|
      # gather domain names
      dns_record +=1 if x.first.first == "DnsRecord"  && x["scope"] == "include"
      # gather mobile apps
      mobile +=1 if x.first.first == "Mobile"  && x["scope"] == "include"
      # gather software
      software_package +=1 if x.first.first == "SoftwarePackage" && x["scope"] == "include"
    end

    out_string << "#{dns_record},#{mobile},#{software_package}"

    puts out_string

end
