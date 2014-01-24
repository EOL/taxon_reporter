require 'coveralls'
Coveralls.wear!

require 'taxon_reporter'

require 'webmock/rspec'
 
RSpec.configure do |config|
  config.include WebMock::API
end

def file_stub(url, filename)
  stub_request(:get, url).to_return(File.new "fixtures/webmock/#{filename}")
end

def he_stub(id)
  file_stub(TaxonReporter::EolDataSource.hierarchy_entries_url(id), "he_#{id}")
end

def page_stub(id)
  file_stub(TaxonReporter::EolDataSource.pages_url(id), "p_#{id}")
end
