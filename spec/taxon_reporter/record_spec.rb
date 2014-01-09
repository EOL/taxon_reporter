require_relative '../spec_helper'

describe TaxonReporter::Record do
  let(:name) { 'Panthera' }
  subject(:record) { TaxonReporter::Record.new(Field.new("Test", "name"), name) }
  
  pending "need to write some tests"
end