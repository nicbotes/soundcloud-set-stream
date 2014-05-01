require 'sinatra'
require_relative './extractor.rb'

get '/' do
	return {running: "true"}.to_json
end

get '/tracks/*' do
	extractor = Extractor.new("/" + params[:splat].first)
	extracted = extractor.extract
	extracted.map{|a| a.title}.to_json
end

get '/stream_tracks/*' do
	extractor = Extractor.new("/" + params[:splat].first)
	extracted = extractor.extract

	file_name = "./#{params[:splat].first.gsub('/','-')}" + ".strm"
	@file = extractor.write_to_file(extracted, file_name)
	send_file @file, :filename => file_name, :type => 'Application/octet-stream'
end
