taxon_reporter
=======

taxon_reporter is a Ruby gem that supports collecting data from a variety of biodiversity source about a given taxon and its descendants

[![Continuous Integration Status][1]][2]
[![Coverage Status][3]][4]
[![CodePolice][5]][6]
[![Dependency Status][7]][8]


Install
-------

General requirements:

  - Ruby version 2.0 or higher
  - MySQL server version 5.1 or higher
  - Web Server for production (Nginx, or Apache)


Running Tests
-------------

    bundle exec rake

Also look at [.travis.yml][9] file for more information


Copyright
---------

Code: [Nathan Wilson][10],[Dmitry Mozzherin][11] 

Copyright (c) 2014 [Marine Biological Laboratory][12]. See [LICENSE][13] for
further details.

[1]: https://secure.travis-ci.org/EOL/taxon_reporter.png
[2]: http://travis-ci.org/EOL/taxon_reporter
[3]: https://coveralls.io/repos/EOL/taxon_reporter/badge.png?branch=master
[4]: https://coveralls.io/r/EOL/taxon_reporter?branch=master
[5]: https://codeclimate.com/github/EOL/taxon_reporter.png
[6]: https://codeclimate.com/github/EOL/taxon_reporter
[7]: https://gemnasium.com/EOL/taxon_reporter.png
[8]: https://gemnasium.com/EOL/taxon_reporter
[9]: https://github.com/EOL/taxon_reporter/blob/master/.travis.yml
[10]: https://github.com/nwilson-EOL
[11]: https://github.com/dimus
[12]: http://mbl.edu
[13]: https://github.com/EOL/taxon_reporter/blob/master/LICENSE

----


# TaxonReporter

Supports collecting data from a variety of biodiversity source about a given taxon and its descendants

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

    report = TaxonReporter.report("Giraffa")

A Report is a set of Taxons.
Report#fields
Report#values(field)

A Taxon is a set of Records.
Taxon#fields
Taxon#values(field)

A Record is a Field and a value (String).

A Field is a DataSource and a name (String)

A DataSource is a name (String), and a url (String)
DataSource#records(name)

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

## Planned Sources

EOL,
GBIF,
Wikipedia,
Index Fungorum,
MycoBank,
Mushroom Observer,
MycoPortal
