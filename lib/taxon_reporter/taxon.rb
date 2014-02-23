require 'set'

module TaxonReporter
  class Taxon
    attr_reader :records
    
    def initialize(records=[])
      @records = []
      @fields = {}
      @values = {}
      records.each {|r| add_record(r)}
    end
    
    def fields; @fields.values; end
    def values(field)
      if field.is_a?(TaxonReporter::Field)
        @values[field.id]
      elsif field.is_a?(String)
        @values[field]
      end
    end
    
    def add_record(record)
      @records.push(record)
      add_values(record.field, record.values)
    end
    
    def add_values(field, values)
      add_field(field)
      @values[field.id] = field.merge_values(@values[field.id], values)
    end

    def add_field(field)
      key = field.id
      @fields[key] = field unless @fields.member?(key)
    end
  end
end
