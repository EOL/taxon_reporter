# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'taxon_reporter/version'

Gem::Specification.new do |spec|
  spec.name          = "taxon_reporter"
  spec.version       = TaxonReporter::VERSION
  spec.authors       = ["Nathan Wilson"]
  spec.email         = ["nathan@collectivesource.com"]
  spec.description   = %q{Supports collecting data from a variety of biodiversity source about a given taxon and its descendants}
  spec.summary       = %q{Uses a set of data sources to first get a set of taxon names and ids, and then asks each source for data about those taxa}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "rspec"
  spec.add_development_dependency "httparty"
  spec.add_development_dependency "webmock"
end
