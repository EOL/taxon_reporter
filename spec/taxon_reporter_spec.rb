require 'spec_helper'

describe TaxonReporter do
  it '.version' do
    expect(TaxonReporter.version).to match /^[\d]+\.[\d]+.[\d]+$/
  end
  
  describe '.report' do
    let(:report) { giraffa_stubs; TaxonReporter.report('Giraffa') }
    
    it 'initializes' do
      expect(report).to be_kind_of TaxonReporter::Report
    end
    
    it 'has taxons' do
      expect(report.taxons).to be_kind_of Array
      expect(report.taxons.length).to be > 1
    end
  end
end
