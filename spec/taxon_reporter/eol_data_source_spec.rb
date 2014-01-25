require_relative '../spec_helper'

describe TaxonReporter::EolDataSource do
  # it ".taxons_from_id with unknown id" do
  #   page_stub(0)
  #   expect(TaxonReporter::EolDataSource.taxons_from_id(0)).to eq([])
  # end
  # 
  # it ".filter_hes" do
  #   expect(TaxonReporter::EolDataSource.filter_hes(Set.new([[1, "ITIS"], [2, "GBIF Nub Taxonomy"], [3, "Index Fungorum"]]))).to eq(Set.new([1,3]))
  # end
  # 
  # context "Giraffa" do
  #   let(:genus) { 'Giraffa' }
  #   let(:id) { 38813 }
  # 
  #   it ".get_eol_ids_from_name" do
  #     file_stub(TaxonReporter::EolDataSource.search_url(genus), 's_Giraffa')
  #     expect(TaxonReporter::EolDataSource.get_eol_ids_from_name(genus)).to eq(Set.new([id]))
  #   end
  #   
  #   it ".taxons_from_id" do
  #     giraffa_stubs
  #     expect(TaxonReporter::EolDataSource.taxons_from_id(id)["scientificName"]).to eq(Set.new([genus]))
  #   end
  #   
  #   it ".search_url" do
  #     expect(TaxonReporter::EolDataSource.search_url(genus)).to match(/api\/search\/#{genus}.json/)
  #   end
  # 
  #   it ".pages_url" do
  #     expect(TaxonReporter::EolDataSource.pages_url(id)).to match(/api\/pages\/#{id}.json/)
  #   end
  # 
  #   it ".hierarchy_entries_url" do
  #     expect(TaxonReporter::EolDataSource.hierarchy_entries_url(id)).to match(/api\/hierarchy_entries\/#{id}.json/)
  #   end
  # 
  # end
end
