require 'set'

module TaxonReporter
  class Field
    attr_reader :source
    attr_reader :name
    attr_reader :id
    
    def initialize(source, name)
      @source = source
      @name = name
      @id = "#{source}:#{name}"
    end
    
    def merge_values(current, new_values)
      result = current
      result = Set.new unless result
      result.merge(new_values)
    end
  end
end
