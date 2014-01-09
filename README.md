# TaxonReporter

Supports collecting data from a variety of biodiversity source about a given taxon

## Installation

Add this line to your application's Gemfile:

    gem 'taxon_reporter'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install taxon_reporter

## Usage

### Required for TaxonEval

To get a TaxonReporter::Report about a taxon:

    report = TaxonReporter.report("Panthera")

To get a Set of associated taxon names (Strings):

    names = report.names

To get all the TaxonReporter.Records of a report as a Set:

    records = report.records

To get all available fields (Set of TaxonReporter.Fields) for a report:

    fields = report.fields

To get the value for a field (TaxonReporter.Field) from a record:

    value = record[field]

### Extensions for Additional Sources

To get the source (String) of a TaxonReporter.Fields:

    source = field.source

To get the name (String) of a TaxonReporter.Fields without the source:

    name = field.name

### Useful Additions

To get the available report fields ("EOL:richness", source => "EOL", name => "richness"):

    fields = TaxonReporter.fields

To get a set of default data sources:

    data_sources = TaxonReporter.data_sources

To create a report from a different set of data sources:

    TaxonReporter.add_data_source(data_source)

To remove a data source:

    TaxonReporter.remove_data_source(data_source)

To get the full record (TaxonReporter.Record) for a taxon in a report:

    record = report[name]

To get the value for a field (String) from a record:

    value = record["EOL:scientificName"]

To get the String form of a TaxonReporter.Field:

    s = field.to_s

To get all available fields (Array of TaxonReporter.Fields) for a record:

    fields = record.fields

## Planned Objects
TaxonReporter.DataSource,
TaxonReporter.Record,
TaxonReporter.Field,

## Planned Sources

EOL,
GBIF,
Wikipedia,
Index Fungorum,
MycoBank,
Mushroom Observer,
MycoPortal

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
