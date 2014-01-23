require 'set'

module TaxonReporter
  class Record
    attr_reader :field
    attr_reader :value
    
    def initialize(field, value)
      @field = field
      @value = value
    end
  end
end
