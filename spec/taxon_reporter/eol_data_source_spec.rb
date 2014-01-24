require_relative '../spec_helper'

describe TaxonReporter::EolDataSource do
  it ".data with unknown id" do
    stub_request(:get, TaxonReporter::EolDataSource.pages_url(0)).to_return(File.new 'fixtures/webmock/p_0')
    expect(TaxonReporter::EolDataSource.data(0)).to eq({})
  end
  
  it ".filter_hes" do
    expect(TaxonReporter::EolDataSource.filter_hes(Set.new([[1, "ITIS"], [2, "GBIF Nub Taxonomy"], [3, "Index Fungorum"]]))).to eq(Set.new([1,3]))
  end
 
  context "Giraffa" do
    let(:family) { 'Giraffa' }
    let(:id) { 38813 }
  
    it ".get_eol_ids_from_name" do
      stub_request(:get, TaxonReporter::EolDataSource.search_url(family)).to_return(File.new 'fixtures/webmock/s_Giraffa')
      expect(TaxonReporter::EolDataSource.get_eol_ids_from_name(family)).to eq(Set.new([id]))
    end
    
    it ".data" do
      stub_request(:get, TaxonReporter::EolDataSource.pages_url(38813)).to_return(File.new 'fixtures/webmock/p_38813')
      [52578134, 49481246, 46598317, 49222053, 49339384, 50650187, 51377284, 24935172, 54413991, 55943656].each do |id|
        stub_request(:get, TaxonReporter::EolDataSource.hierarchy_entries_url(id)).to_return(File.new "fixtures/webmock/he_#{id}")
      end
      expect(TaxonReporter::EolDataSource.data(id)["scientificName"]).to eq(Set.new([family]))
    end
    
    it ".search_url" do
      expect(TaxonReporter::EolDataSource.search_url(family)).to match(/api\/search\/#{family}.json/)
    end
  
    it ".pages_url" do
      expect(TaxonReporter::EolDataSource.pages_url(id)).to match(/api\/pages\/#{id}.json/)
    end

    it ".hierarchy_entries_url" do
      expect(TaxonReporter::EolDataSource.hierarchy_entries_url(id)).to match(/api\/hierarchy_entries\/#{id}.json/)
    end
  
  end
end
