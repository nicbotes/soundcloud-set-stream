require 'httparty'
require 'awesome_print'
require 'soundcloud'

class Extractor
	class SoundCloudConnector
	  include HTTParty
	  base_uri 'www.soundcloud.com'
	end

	def initialize(set_url)
		@set_url = set_url
	end

	def extract
		response = SoundCloudConnector.get(@set_url)
		
		content = response.scan(/meta content=\"http:\/\/soundcloud.com\/.*itemprop=/)

		base = "http:\/\/soundcloud.com"
		urls = []
		content.each do |c|
			match = /#{base}(?<rest>(\/[A-Za-z\-0-9]*)*)/.match(c)
			urls << match[:rest]
		end

		api_call = 'http://api.soundcloud.com/tracks/'
		consumer_key = '/stream?consumer_key=hijuflqxoOqzLdtr6W4NA'

		client = SoundCloud.new(:client_id => "hijuflqxoOqzLdtr6W4NA")

		formatted = urls[1..-1].map{|a|
			url = base + a
			begin
				track = client.get('/resolve', :url => url)

				OpenStruct.new(
					url: base + a,
					track_id: track.id,
					api_call: api_call + track.id.to_s + consumer_key,
					title: track.title
					)
			rescue
				nil
			end
		}
		formatted.compact
	end

	def write_to_file(media_content, file_name)
		file = File.new(file_name, "w")
		File.open(file, 'w') { |file| file.write(media_content.map{|a| a[:api_call]}.join("\n").to_s) }
		return file
	end

end
