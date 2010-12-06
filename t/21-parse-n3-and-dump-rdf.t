#!/usr/bin/perl -T
#
# Test this module simple N3 example
#
# $Id: 21-parse-n3-and-dump-rdf.t,v 1.4 2010-12-06 14:44:02 simeon Exp $
use strict;
use warnings;

use English qw(-no_match_vars);
use Test::More;
plan('tests'=>4);

use_ok( 'SemanticWeb::OAI::ORE::ReM' );
use_ok( 'SemanticWeb::OAI::ORE::N3' );

%ENV=();

my $n3_src_file='t/examples/datamodel-overview/combined.n3';
my $rdfxml_file='t/examples/datamodel-overview/combined.rdf.dump';

print "# Using test file $n3_src_file\n";
if (not -r $n3_src_file) {
  BAIL_OUT("Configuration problem, can't find test file $n3_src_file\n");
}

my $rem=SemanticWeb::OAI::ORE::ReM->new('debug'=>1);
if (not $rem->parsefile('n3',$n3_src_file)) {
  BAIL_OUT("Parse error with $n3_src_file: errstr=".$rem->errstr()."\n");
}

print "# File $n3_src_file parsed OK\n";
my $test=$rem->model->as_rdfxml;
my $test_tmp='t/tmp';
ok(-d $test_tmp and -w $test_tmp,"Test tmp dir ($test_tmp) exists/writable");
my $test_file="$test_tmp/21-parse-n3-and-dump-rdf.rdf";
dump_str_to_file($test,$test_file,"RDFXML dump");
my $dump=read_file($rdfxml_file);
is($test,$dump,"Check RDFXML dump from N3 input against stored dump: $test_file $rdfxml_file");


# Read $file and return as string, empty string on failure
#
sub read_file {
  my ($file)=@_;
  my $str='';
  if (open(my $fh,'<',$file)) {
    local $INPUT_RECORD_SEPARATOR=undef;
    $str=<$fh>;
  }
  return($str);
}

sub dump_str_to_file {
  my ($str,$file,$msg)=@_;
  if (open(my $fh,'>',$file)) {
    print {$fh} $str;
    close($fh);
    print "# Dumped $msg to $file\n";
  } else {
    die "Can't write $msg to $file: $!";
  }
}
