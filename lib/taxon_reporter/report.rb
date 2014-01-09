require 'set'

module TaxonReporter
  class Report
    def initialize(name); @names = Set.new([name]); end
    def names; @names; end
  end
end
