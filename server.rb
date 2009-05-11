require 'rubygems'
require 'sinatra'
require 'indesign/server'
require 'hpricot'

get '/up?' do
    Indesign::Server.up?
end

get '/start' do
    Indesign::Server.start
end

get '/stop' do
    Indesign::Server.stop
end

get '/process_indd/:arg0/:arg1/:arg2' do
    #TODO receber GETs  path_to_indd,  path_to_jpgs,  path_to_xml...
    #TODO acessar via SOAP e rodar o método process_indd
    #TODO ver se é mais rápido fazer isso ou fazer pelo cliente que já tem escrito em JAVA... (acho q não vai melhorar...)
    #    arg0 = "#{Indesign::Server.win_path}in/templates/#{id}/original_#{indd_file_name}"
    #    arg1 = "#{Indesign::Server.win_path}out/templates/#{id}/#{indd_file_name.gsub(/indd/,'jpg')}"
    #    arg2 = "#{Indesign::Server.win_path}out/templates/#{id}/#{indd_file_name.gsub(/indd/,'xml')}"
    #    FileUtils.mkdir_p("win/out/templates/#{id}")
#raise params.inspect
    r = Indesign::Server.process_indd(params[:arg0], params[:arg1], params[:arg2])
    return "0" unless r
    r.scriptResult.data.inspect
end

get '/generate_thumbnail' do
    #TODO receber GETs  path_to_indd,  page/pages, path_to_jpgs
    #TODO acessar via SOAP e rodar o método generate_thumbnail
    r = Indesign::Server.generate_thumbnail(arg0, arg1)
    return "0" unless r
    r.scriptResult.data.inspect
end

