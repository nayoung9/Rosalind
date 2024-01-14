#!/usr/bin/perl
#
#
my $in = shift;
open(F,$in);
my $q = <F>;
my $str = <F>;
my $n = <F>;
close(F);

chomp($q);
chomp($str);
chomp($n);

my $len = length($str);
my $qlen = length($q);
for(my $i = 0 ; $i < $len; $i ++){
	my $substr = substr($str, $i,$qlen);
	my $hd = hdCalc($substr,$q,$qlen);
	if (!($hd > $n)){
		print $i." ";
	}
} 

sub hdCalc{
	my $seq1 = shift;
	my $seq2 = shift;
	my $hd = 0;
	my $len = shift;
	for (my $i = 0 ; $i < $len ; $i ++ ){
		my $a1 = substr($seq1,$i,1);
		my $a2 = substr($seq2,$i,1);
		if($a1 ne $a2){
			$hd ++;
		}
	}
	return $hd;
}
