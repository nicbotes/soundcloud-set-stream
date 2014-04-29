require 'sinatra'
require_relative './extractor.rb'

get '/'
	return {running: "true"}.to_json
end

get '/strip_set/*' do
	extractor = Extractor.new("/" + params[:splat].first)
	extracted = extractor.extract
	extracted.map{|a| a.api_call}.to_json
end

get '/save_strip_set/*' do
	extractor = Extractor.new("/" + params[:splat].first)
	extracted = extractor.extract
	extractor.write_to_file(extracted)
	return "saved"
end
