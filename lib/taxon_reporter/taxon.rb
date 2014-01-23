require 'set'

module TaxonReporter
  class Taxon
    def initialize(records=[])
      @records = []
      @fields = {}
      @values = {}
      records.each {|r| add_record(r)}
    end
    
    def fields; @fields.values; end
    def value(field); @values[field.id]; end

    def add_field(field)
      key = field.id
      @fields[key] = field unless @fields.member?(key)
    end
    
    def add_value(field, value)
      add_field(field)
      @values[field.id] = field.merge_values(@values[field.id], value)
    end
    
    def add_record(record)
      @records.push(record)
      add_value(record.field, record.value)
    end
  end
end
