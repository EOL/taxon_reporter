require 'set'

module TaxonReporter
  class Report
    @@data_sources = Set.new([EolDataSource])
    
    def taxons; @taxons; end
    
    def initialize(name)
      @name = name
      @taxons = []
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
        data_source.add_data(t) # Handling new fields???
      end
    end
  end
end
