#!perl -T

use Test::More tests => 5;

BEGIN {
	use_ok( 'SemanticWeb::OAI::ORE::ReM' );
	use_ok( 'SemanticWeb::OAI::ORE::Model' );
	use_ok( 'SemanticWeb::OAI::ORE::Constant' );
	#use_ok( 'SemanticWeb::OAI::ORE::Atom' );
	#use_ok( 'SemanticWeb::OAI::ORE::AtomWriter' );
	use_ok( 'SemanticWeb::OAI::ORE::N3' );
	use_ok( 'SemanticWeb::OAI::ORE::RDFXML' );
}

diag( "Testing SemanticWeb::OAI::ORE $SemanticWeb::OAI::ORE::ReM::VERSION, Perl $], $^X" );
