require 'set'

module TaxonReporter

  class EolDataSource < DataSource
    def self.has_classification?; true; end
    
    @@fields = {}
    
    def self.fields; @@fields.values; end
    
    def self.find_taxa(name)
      result = []
      ids = self.get_eol_ids_from_name(name)
      if ids
        ids.each do |id|
          result += self.taxons_from_id(id)
        end
      end
      result
    end

    def self.get_eol_ids_from_name(name) # Set of ids
      get_api_result(search_url(name), ["results", "id"])
    end

    def self.search_url(name); "http://eol.org/api/search/#{URI::escape(name)}.json?exact=1&cache_ttl=86400"; end
    
    def self.taxons_from_id(id)
      result = []
      records = self.records(id, PAGES_CLASSIFICATION_DATA)
      if records.length > 0
        taxon = TaxonReporter::Taxon.new(records)
        result << taxon
        children = taxon.values(@@fields['children'])
        if children
          children.each {|c| result += taxons_from_id(c)}
        end
      end
      result
    end

    PAGES_CLASSIFICATION_DATA = {
      "eol_id" => ["identifier"],
      "richness" => ["richness_score"],
      "ranks" => ["taxonConcepts", "taxonRank"],
      "scientificName" => ["scientificName"],
      "he_ids" => ["taxonConcepts", ["identifier", "nameAccordingTo"]]
    }

    def self.records(id, fields)
      result = []
      add_children(get_api_results(pages_url(id), fields)).each do |k, v|
        result.push(TaxonReporter::Record.new(add_field(k), v))
      end
      result
    end

    def self.add_children(results)
      children = eol_children(filter_hes(results["he_ids"]))
      results["children"] = children if children.length > 0
      results
    end
    
    def self.pages_url(id)
      "http://eol.org/api/pages/#{id}.json?images=0&videos=0&sounds=0&maps=0&text=0&iucn=false&details=false&common_names=false&synonyms=false&references=false&cache_ttl=86400"
    end

    def self.add_field(field_name)
      @@fields[field_name] = TaxonReporter::Field.new(DATA_SOURCE_NAME, field_name) unless @@fields.member?(field_name)
      @@fields[field_name]
    end

    DATA_SOURCE_NAME = "EOL"

    BAD_PROVIDERS = ["GBIF Nub Taxonomy"]

    def self.filter_hes(hes_with_provider)
      if hes_with_provider
        result = Set.new
        hes_with_provider.each do |he, provider|
          result << he unless BAD_PROVIDERS.member?(provider)
        end
        result
      end
    end

    HE_DATA = {
      "children" => ["children", "taxonConceptID"]
    }

    def self.eol_children(he_ids)
      result = Set.new
      if he_ids
        he_ids.each do |he_id|
          result += (get_api_results(hierarchy_entries_url(he_id), HE_DATA)["children"] || [])
        end
      end
      result.sort
    end

    def self.hierarchy_entries_url(id); "http://eol.org/api/hierarchy_entries/#{id}.json?common_names=false&synonyms=false&cache_ttl=86400"; end

    def self.add_data(taxon)
      ids = taxon.values("#{DATA_SOURCE_NAME}:eol_id")
      ids.each do |id|
        self.records(id, PAGES_REPORT_DATA).each {|r| taxon.add_record(r)}
      end
    end

    PAGES_REPORT_DATA = {
      "richness" => ["richness_score"],
      "ranks" => ["taxonConcepts", "taxonRank"],
    }
    
  end
end
