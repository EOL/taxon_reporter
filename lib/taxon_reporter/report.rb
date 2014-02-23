require 'set'

module TaxonReporter
  class Report
    @@data_sources = Set.new([EolDataSource])
    
    def taxons; @taxons; end
    def fields; @fields; end
    
    def initialize(name)
      @name = name
      @taxons = []
      @fields = []
      # TaxonReporter::Report.load_data(name).each {|t| add_taxon(t)}
    end
    
    def load_taxa
      @@data_sources.each do |ds|
        if ds.has_classification?
          @taxons += ds.find_taxa(@name)
        end
      end
    end
    
    def load_data(data_source)
      @taxons.each do |t|
        data_source.add_data(t)
      end
    end
    
    def add_taxon(taxon)
      @taxons.push(taxon)
      @fields += taxon.fields      
    end
  end
end
