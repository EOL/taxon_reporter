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
      report.load_taxa
      expect(report.taxons).to be_kind_of Array
      expect(report.taxons.length).to be > 1
    end
    
    it 'has eol_id' do
      report.load_taxa
      report.load_data(TaxonReporter::EolDataSource)
      expect(report.taxons[0].values("EOL:eol_id").first).to be_kind_of Fixnum
    end
  end
  
  describe '.report with unrecognized name' do
    it 'has no taxons' do
      my_name_stubs
      empty_report = TaxonReporter.report('My Name')
      expect(empty_report.taxons).to eq []
    end
  end
end
