require 'set'

module TaxonReporter
  class Record
    def initialize(field, value)
      @field = field
      @value = value
    end
  end
end
