require 'coveralls'
Coveralls.wear!

require 'taxon_reporter'

require 'webmock/rspec'
 
RSpec.configure do |config|
  config.include WebMock::API
end
