require 'coveralls'
Coveralls.wear!

require 'taxon_reporter'

require 'webmock/rspec'
 
RSpec.configure do |config|
  config.include WebMock::API
end

def file_stub(url, filename)
  stub_request(:get, url).to_return(File.new "spec/webmock/#{filename}")
end

def he_stub(he_id)
  file_stub("http://eol.org/api/hierarchy_entries/#{he_id}.json?cache_ttl=86400&common_names=false&synonyms=false", "he_#{he_id}")
end
