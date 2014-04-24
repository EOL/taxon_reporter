require 'set'

module TaxonReporter
  class Field
    attr_reader :source
    attr_reader :name
    attr_reader :id
    
    @@field_list = {}
    
    def self.id(source, name); "#{source}:#{name}"; end
    
    def self.factory(source, name) # Need test
      index = id(source, name)
      @@field_list.member?(index) ? @@field_list[index] : @@field_list[index] = self.new(source, name)
    end
    
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
