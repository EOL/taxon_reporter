taxon_reporter
=======

taxon_reporter is a Ruby gem that supports collecting data from a variety of biodiversity source about a given taxon and its descendants

[![Continuous Integration Status][1]][2]
[![Coverage Status][3]][4]
[![CodePolice][5]][6]
[![Dependency Status][7]][8]


Installing
----------

Add this line to your application's Gemfile:

    gem 'taxon_reporter'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install taxon_reporter


Running Tests
-------------

    bundle exec rake


Usage
-----

To get a TaxonReporter::Report about a taxon:

    report = TaxonReporter.report("Giraffa")

TaxonReporter::Report

    Report#fields - Array of TaxonReporter::Fields
    Report#taxons - Array of TaxonReporter::Taxons

TaxonReporter::Field

    Field#source - String. Should be unique for each data source.
    Field#name - Name of Field.  Should be unique given a source.
    Field#id - Unique combination of source and name
    Field#merge_values - Default method for merging values for this Field.

TaxonReporter::Taxon

    Taxon#new(records=[]) - records should be a list of TaxonReporter::Records.
    Taxon#add_record(record) - Adds a single TaxonReporter::Record.
    Taxon#fields - Array of TaxonReporter::Fields associated with this taxon.
    Taxon#values(field) - Merge of all the values (typically a Set) for the given TaxonReporter::Field
  
TaxonReporter::Record

    Record#field - Associated TaxonReporter::Field
    Record#values - Values (typically a Set)


Updating the Gem
----------------

    gem build taxon_reporter.gemspec
    gem push taxon_reporter-0.0.1.gem

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
