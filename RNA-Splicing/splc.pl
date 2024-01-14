#!/usr/bin/perl
#
#
use strict;
use warnings;

my $f_in = shift;
my %hs_all = ();
my $main = 0;
my $mainstr = "";
my $id = 0;
open(F,"$f_in");
while(<F>){
	chomp;
	if ($_ =~ /^>/){
		$main ++;	
		$id ++;
		next;
	}else{
		if ($main == 1){
			$mainstr .= $_;
		}else{
			$hs_all{$id} .= $_;	
		}
	}
}
close(F);

foreach $id (keys %hs_all){
	my $this = $hs_all{$id};
	$mainstr =~ s/$this//;
}
print $mainstr."\n";
