require 'builder'

def generate_xml
  xml = Builder::XmlMarkup.new( :indent => 2 )
  xml.instruct! :xml, :encoding => "UTF-8"
  xml.issue do |i|
    i.title "Especial"
    i.volume "05"
    i.number "31"
    i.year "2012"
  end
end
result = generate_xml
File.open('download.xml', 'w') {|f| f.write(result) }
