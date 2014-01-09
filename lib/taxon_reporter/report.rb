require 'set'

module TaxonReporter
  class Report
    def initialize(name)
      @names = Set.new([name])
      @records = Set.new([Record.new(Field.new("TaxonReporter", "Name"), name)])
    end
    
    def names; @names; end
    def records; @records; end
  end
end
