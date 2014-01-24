require_relative '../spec_helper'

describe TaxonReporter::DataSource do
  it ".process_response" do
    expect(TaxonReporter::DataSource.process_response(1, [])).to eq(Set.new([1]))
    expect(TaxonReporter::DataSource.process_response("foo", [])).to eq(Set.new(["foo"]))
    expect(TaxonReporter::DataSource.process_response([1,2,3], [])).to eq(Set.new([1,2,3]))
    expect(TaxonReporter::DataSource.process_response({"a" => 1, "b" => 2, "c" => 3}, [])).to eq(Set.new([{"a" => 1, "b" => 2, "c" => 3}]))
    expect(TaxonReporter::DataSource.process_response(1, ["b"])).to be_nil
    expect(TaxonReporter::DataSource.process_response("foo", ["b"])).to be_nil
    expect(TaxonReporter::DataSource.process_response([1,2,3], ["b"])).to be_nil
    expect(TaxonReporter::DataSource.process_response([1,2,3], ["b"])).to be_nil
    expect(TaxonReporter::DataSource.process_response({"a" => 1, "b" => 2, "c" => 3}, ["b"])).to eq(Set.new([2]))
    expect(TaxonReporter::DataSource.process_response({"a" => 1, "b" => [{"x" => 1}, {"x" => 2}], "c" => 3}, ["b", "x"])).to eq(Set.new([1,2]))
    expect(TaxonReporter::DataSource.process_response([{"a" => 1, "b" => "x", "c" => "m"}, {"a" => 2, "b" => "y", "c" => "n"}],
      [["a", "c"]])).to eq(Set.new([[1, "m"], [2, "n"]]))
    expect(TaxonReporter::DataSource.process_response({
      "A" => [{"a" => 1, "b" => "x", "c" => "m"}, {"a" => 2, "b" => "y", "c" => "n"}],
      "B" => [{"a" => 3, "b" => "u", "c" => "o"}, {"a" => 4, "b" => "v", "c" => "p"}]
    }, ["A", ["a", "c"]])).to eq(Set.new([[1, "m"], [2, "n"]]))
  end

  it ".get_api_response" do
    stub_request(:get, "http://eol.org/api/ping").to_return(File.new 'fixtures/webmock/ping')
    expect(TaxonReporter::DataSource.get_api_response("http://eol.org/api/ping")).to_not be_nil
  end

  context "search/Giraffa" do
    let(:url) { "http://eol.org/api/search/Giraffa.json?cache_ttl=86400&exact=t1" }
    let(:path) { ["results", "id"] }
    let(:result) { File.new 'fixtures/webmock/s_Giraffa'}
    
    it ".get_api_result" do
      stub_request(:get, url).to_return(result)
      expect(TaxonReporter::DataSource.get_api_result(url, path)).to eq(Set.new([38813]))
    end

    it ".get_api_results" do
      stub_request(:get, url).to_return(result)
      expect(TaxonReporter::DataSource.get_api_results(url,
             {"id" => path})).to eq({"id" => Set.new([38813])})
    end
  end
end
