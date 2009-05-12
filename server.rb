require 'rubygems'
require 'sinatra'
require 'indesign/server'
require 'hpricot'

IDS_PORT = "12345"
CACHE_PATH = "C:/cache"

get '/up?' do
    Indesign::Server.up?
end

get '/start' do
    Indesign::Server.start
end

get '/stop' do
    Indesign::Server.stop
end

get '/process_indd/:id/:name' do

	require 's3/s3connect' 

	s3_for_indds = S3connect.indd
	s3_for_assets = S3connect.assets

	s3_path = "#{params[:id]}-#{params[:name]}"
	#raise Time.now.to_s
	local_path = "#{CACHE_PATH}/#{s3_path}"
	unless File.exists?(local_path)
		File.open(local_path,'wb'){|f| f.write(s3_for_indds.get_file(s3_path)) }
		return "-3" unless File.exists?(local_path) or File.zero?(local_path)
	end
	thumbs_path = "#{local_path}.jpg"
	xml_path = "#{local_path}.xml"
	r = Indesign::Server.process_indd(local_path, thumbs_path, xml_path)
    return "-2" unless r
	xml_s3_path = "#{s3_path}.xml"
	s3_for_assets.store(xml_path, xml_s3_path, :access => :public_read) unless s3_for_assets.exists?(xml_s3_path)
	
	for jpg in Dir.glob("#{CACHE_PATH}/#{params[:id]}-*.jpg")
		jpg_s3_path = jpg.gsub(/#{CACHE_PATH}\//,'')
		#File.open("C:/cache/fff.jpg","wb"){|f| f.write File.open(jpg,'rb').read }
		#raise "OK #{jpg}"
		#raise (File.read(jpg).length / 1024).to_s
		s3_for_assets.store(jpg, jpg_s3_path, :access => :public_read) unless s3_for_assets.exists?(jpg_s3_path)
	end
#	return "-1"
    return File.read(xml_path)
end

get '/generate_thumbnail' do
    #TODO receber GETs  path_to_indd,  page/pages, path_to_jpgs
    #TODO acessar via SOAP e rodar o método generate_thumbnail
    r = Indesign::Server.generate_thumbnail(arg0, arg1)
    return "0" unless r
    r.scriptResult.data.inspect
end

