#!/usr/bin/env ruby

require 'json'
require 'anemone'
require 'pry'

class Program

  def initialize(hash)
    @program_name = hash["program_name"]

    #create an array full of targets
    @targets = []
    hash["scope"].each do |x|
      @targets << DnsRecordTarget.new(x) if x["DnsRecord"]
    end
    @targets
  end

  def name
    @program_name
  end

  def targets
    @targets
  end
puts @targets
end



class Target

  def initialize(t)
    @t = t
  end

end

class DnsRecordTarget < Target

  def crawl

    #create the URI
    uri = "https://#{@t["DnsRecord"]}" if @t["DnsRecord"]

    Anemone.crawl(uri) do |anemone|

      # crawl and do cool shit
      anemone.on_every_page do |page|

          puts page.url

          ### do cool shit here
          if page.code == 301; puts "REDIRECTING!"; end

      end
    end
  end
end
|t| t.crawl
