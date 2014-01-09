require 'spec_helper'

describe TaxonReporter do
  it '.version' do
    expect(TaxonReporter.version).to match /^[\d]+\.[\d]+.[\d]+$/
  end
  
  it '.report' do
    expect(TaxonReporter.report('Panthera').class).to eq(TaxonReporter::Report)
  end
end
