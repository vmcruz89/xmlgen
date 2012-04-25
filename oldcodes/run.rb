# myapp.rb
require 'sinatra'
require 'rubygems'
require 'builder'

get "/" do
#  erb :generator
redirect '/generator'
end

get "/generator" do
  erb :generator
end

post "/generator" do
 def generate_xml
  xml = Builder::XmlMarkup.new( :indent => 2 )
  xml.instruct! :xml, :encoding => "UTF-8"
  xml.edicao do |e|
    e.titulo params[:titulo]
    e.volume params[:volume]
    e.numero params[:numero]
    e.ano params[:ano]
  xml.secao do |s|
    s.tit_secao params[:tit_secao]
    s.abrev params[:abrev]
  xml.artigo do |a|
    a.tit_art params[:tit_art]
    a.resumo params[:resumo]
    a.num_pag params[:num_pag]
    a.data_pub params[:data_pub]
  xml.autor do |t|
    t.first params[:first]
    t.middle params[:middle]
    t.last params[:last]
    t.email params[:email]
      end
    end
    e.edicao "HTML"
    e.filepath params[:filepath]
  end
 end
end
result = generate_xml
File.open('download.xml', 'w') {|f| f.write(result) }
send_file 'download.xml'
end
