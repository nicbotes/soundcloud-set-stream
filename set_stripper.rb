require 'sinatra'
require_relative './extractor.rb'

get '/strip_set/*' do
	extractor = Extractor.new("/" + params[:splat].first)
	extracted = extractor.extract
	extracted.map{|a| a.api_call}.to_json
end
