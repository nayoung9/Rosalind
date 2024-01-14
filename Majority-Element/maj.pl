#!/usr/bin/perl
#
#
#
my $f_in = shift;
my @ar_all = ();
open(F,"$f_in");
my $tmp = <F>;
chomp($tmp);
my ($k, $n) = split(/ /,$tmp);
while(<F>){
	chomp;
	push(@ar_all,$_);
}
close(F);

foreach my $thisarr (@ar_all){
	my @tmp = split(/ /,$thisarr);
	my %hs_info = ();
	my $save = -1;
	foreach my $val (@tmp){
		$hs_info{$val}++;
		if ($hs_info{$val}>($n/2)){$save = $val; last;}
	}
	print $save," ";
}
