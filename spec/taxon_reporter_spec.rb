require 'spec_helper'

describe TaxonReporter do
  it '.version' do
    expect(TaxonReporter.version).to match /^[\d]+\.[\d]+.[\d]+$/
  end

  def report_stubs
    file_stub('http://eol.org/api/search/Giraffa.json?exact=1&cache_ttl=86400', 's_Giraffa')
    [
      10523172, 10643171, 13611746, 13828910, 21640907, 308378, 32137376, 32137377, 38813, 4445991,
      4445992, 4445998, 4446006, 4446007, 4446008, 4446010, 4446011, 4446012,
    ].each {|page_id| page_stub(page_id)}
    [
      24935172, 24935173, 46598317, 46598318, 49222053, 49222054, 49222055, 49222056, 49222057, 49222058,
      49339384, 49339385, 49339386, 49339387, 49339388, 49339389, 49481246, 49481247, 49481248, 49481249,
      49481250, 49481251, 49481252, 49481253, 50650187, 50650188, 51377284, 51377285, 51377286, 51377287,
      51377288, 51377289, 51377290, 51377291, 51377292, 51377293, 52578134, 52578135, 54413991, 54413992,
      54413993, 54413994, 54413995, 54413996, 54413997, 54413998, 55943656, 55943657, 55943658, 55943659,
      55943660, 55943661, 55943662, 55943663, 
    ].each {|he_id| he_stub(he_id)}
  end
  
  describe '.report' do
    let(:report) { report_stubs; TaxonReporter.report('Giraffa') }
    
    it 'initializes' do
      expect(report).to be_kind_of TaxonReporter::Report
    end
    
    it 'has taxons' do
      expect(report.taxons).to be_kind_of Array
      expect(report.taxons.length).to be > 1
    end
  end
end
