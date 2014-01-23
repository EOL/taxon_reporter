require 'spec_helper'

describe TaxonReporter do
  it '.version' do
    expect(TaxonReporter.version).to match /^[\d]+\.[\d]+.[\d]+$/
  end

  def report_stubs
    file_stub('http://eol.org/api/search/Panthera.json?cache_ttl=86400&exact=1', 'search_Panthera')
    file_stub('http://eol.org/api/pages/14134.json?cache_ttl=86400&common_names=false&details=false&images=0&iucn=false&maps=0&references=false&sounds=0&synonyms=false&text=0&videos=0', 'pages_14134')
    [52577711, 50279619, 24951378, 49341989, 49226231, 50650451, 51376364, 46597375, 55942027].each {|he_id| he_stub(he_id)}
  end
  
  describe '.report' do
    let(:report) { report_stubs; TaxonReporter.report('Panthera') }
    
    it 'initializes' do
      expect(report).to be_kind_of TaxonReporter::Report
    end
    
    it 'has taxons' do
      expect(report.taxons).to be_kind_of Array
      # expect(report.taxons.length).to be > 1
    end
  end
end
