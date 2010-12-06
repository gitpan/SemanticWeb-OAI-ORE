use strict;
use warnings;
use ExtUtils::MakeMaker;

WriteMakefile(
    NAME                => 'SemanticWeb::OAI::ORE',
    AUTHOR              => 'Simeon Warner <simeon@cpan.org>',
    ABSTRACT            => 'Modules to read/write/modify OAI-ORE resource maps',
    VERSION_FROM        => 'lib/SemanticWeb/OAI/ORE/ReM.pm',
    PL_FILES            => {},
    PREREQ_PM => {
        'Algorithm::Diff' => 0,
	'Class::Accessor' => 0,
        'Data::UUID' => 0,
        'DateTime' => 0,
        'RDF::Core' => 0.51,
        'RDF::Core::Model' => 0,
        'RDF::Notation3' => 0.91,
        'RDF::Notation3::RDFCore' => 0,
        'Test::More' => 0,
	'XML::Atom::Syndication' => 0.942,
	'XML::Atom::Syndication::Writer' => 0,
        'XML::Writer' => 0.611,
    },
    dist                => { COMPRESS => 'gzip -9f', SUFFIX => 'gz', },
    clean               => { FILES => 'SemanticWeb-OAI-ORE-*' },
);
