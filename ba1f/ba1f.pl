#!/usr/bin/perl
#
#
my $string = shift;
open(F,"$string");
$string = <F>;
chomp($string);
close(F);
my $length = length($string);

my $gcnt = () = $string =~ m/G/g;
my $ccnt = () = $string =~ m/C/g;
my $initDiff = $ccnt - $gcnt;
my $diff = $initDiff;
my %hs_skw_idx = ();
$hs_skw_idx{$diff} .= " 0";
for(my $i = 1; $i < $length ; $i ++ ){
	my $substr2 = substr($string,$i-1,1);
	if ($substr2 eq "G"){
		$diff ++	
	}
	if ($substr2 eq "C"){
		$diff --
	}
	$hs_skw_idx{$diff} .= " $i";
}

foreach my $val (sort {$a <=> $b} keys %hs_skw_idx){
	print $val."\t";
	print $hs_skw_idx{$val}."\n";
	last;
}
