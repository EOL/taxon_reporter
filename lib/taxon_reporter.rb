require "taxon_reporter/version"
require "taxon_reporter/report"

module TaxonReporter
  def self.version
    VERSION
  end
  
  def self.report(name); Report.new(name); end
    
end
