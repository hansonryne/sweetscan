require 'nokogiri'
doc = File.open("test.xml") { |f| Nokogiri::XML(f) }

puts doc.to_html