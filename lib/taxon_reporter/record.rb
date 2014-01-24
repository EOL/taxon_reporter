require 'set'

module TaxonReporter
  class Record
    attr_reader :field
    attr_reader :values
    
    def initialize(field, values)
      @field = field
      @values = values
    end
  end
end
