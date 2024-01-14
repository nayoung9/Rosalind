#!/usr/bin/perl
#
#
my $f= shift;
open(F,"$f");
my $n = <F>;
chomp ($n);
my $tmpstr = <F>;
chomp($tmpstr);
my @ar_str = split(/ /,$tmpstr);
close(F);

my $k = 0;
my $swapcnt = 0;

print $n."\n";
print "@ar_str\n";

for (my $i = 1;  $i < $n ;$i ++ ){
	$k = $i;
	while($k > 0 && $ar_str[$k] < $ar_str[$k-1]){
		#SWAP($ar_str[$k], $ar_str[$k-1])
		####
		my $tmp1 = $ar_str[$k];
		$ar_str[$k] = $ar_str[$k-1];
		$ar_str[$k-1] = $tmp1;
		$swapcnt ++;
		#
		$k = $k-1;
	}
}

print $swapcnt."\n";
