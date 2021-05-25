#!/usr/bin/perl -w
#===============================================================================
#
#         FILE: hes.pl
#
#        USAGE: ./hes.pl <input_file>
#
#  DESCRIPTION: Converts utf-8 Hesychius lexicon from TLG to dsl format
#
#       AUTHOR: proteus (), proteus@softhome.net
#      VERSION: 1.0
#      CREATED: 05/20/2021
#===============================================================================

use strict;
use warnings;
use utf8;
use File::Slurp::Unicode;
binmode STDOUT, ":utf8";

my $hes_text = shift @ARGV;
my $hes = read_file($hes_text, encoding => 'utf8' );

my @lemas = split(/\x{a7}/, $hes);
shift @lemas;

foreach my $lema (@lemas){
  my ($index, $head, $body);
  $lema =~ m/^(\w+(?:\s\w+)?\.\d+)/;
  $index = $1;
  my $rem = $';
  $rem =~ s/\n?\s+/ /gs;
  $rem =~ s/\- //g;
  $rem =~ s/.*?\x{2329}/\x{2329}/;
  $rem =~ s/^[\*\x{2020}]+/\x{2329}/;
  $rem = "〈". $rem unless $rem =~ m/^\x{2329}/;
  $rem =~ s/\x{2329}\x{232a}/\x{2329}/;
  $rem =~ s/ /\x{232a}/ unless $rem =~ m/\x{232a}/;
  $rem =~ m/\x{2329}(.*?)(?:\x{232a}|\x{0387})/;
  $head = $1;
  $body = $';
  $body =~ s/\x{0387} //;
  $body =~ s/[\]\[]//g;
  $body =~ s/\x{2329}/[b]/gs;
  $body =~ s/\x{232a}/[\/b]/gs;
  $body =~ s/^/[m1]/;
  $body =~ s/\s+$/[\/m]/;
  if ($head) { print "$head\n" } else { warn $index };   # Warn in case of defects
  print "\t[m1][c limegreen]$index [/c]\n";
  print "\t$body\n";
}
