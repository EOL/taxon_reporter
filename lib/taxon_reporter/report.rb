require 'set'

module TaxonReporter
  class Report
    @@data_sources = Set.new([EolDataSource])
    
    def self.load_data(name)
      result = []
      @@data_sources.each do |ds|
        result += ds.taxons_from_name(name)
      end
      result
    end
    
    def initialize(name)
      @taxons = []
      @fields = []
      TaxonReporter::Report.load_data(name).each {|t| add_taxon(t)}
    end
    
    def taxons; @taxons; end
    def fields; @fields; end
    
    def add_taxon(taxon)
      @taxons.push(taxon)
      @fields += taxon.fields      
    end
  end
end
