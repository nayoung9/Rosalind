#!/usr/bin/perl
#
use strict;
use warnings ;

my $f_in = shift;
my %hs_all = ();
my $id = "";
open(F,"$f_in");
while(<F>){
	chomp;
	if ($_ =~ /^>(.+)/){
		$id = $1;
	}else{
		$hs_all{$id} .= $_;
	}
}
close(F);

my @ar_id = keys(%hs_all);
my @ar_str1 = split(//,$hs_all{$ar_id[0]});
my @ar_str2 = split(//,$hs_all{$ar_id[1]});

my %hs_ticheck = ("A" => "G", "G" => "A", "C" => "T", "T" => "C");


my $ticnt = 0;
my $tvcnt = 0;
for (my $i = 0 ; $i <= $#ar_str1 ; $i ++){
	if ($ar_str1[$i] eq $ar_str2[$i]){next;}
	if ($hs_ticheck{$ar_str1[$i]} eq $ar_str2[$i]){
			$ticnt++;
		}else{
			$tvcnt ++;
		}
}
print $ticnt/$tvcnt."\n"
