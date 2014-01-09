require "taxon_reporter/version"
require "taxon_reporter/data_source"
require "taxon_reporter/field"
require "taxon_reporter/record"
require "taxon_reporter/report"

module TaxonReporter
  def self.version
    VERSION
  end
  
  def self.report(name); Report.new(name); end
    
end
