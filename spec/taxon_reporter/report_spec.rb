require_relative '../spec_helper'

describe TaxonReporter::Report do
  let(:name) { 'Panthera' }
  subject(:report) { TaxonReporter::Report.new(name) }
  
  it '.names' do
    expect(report.names.class).to eq(Set)
    expect(report.names.member?(name)).to be_true
  end
end