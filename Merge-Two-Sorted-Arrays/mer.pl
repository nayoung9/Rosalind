#!/usr/bin/perl
#
#

my $f_in =shift;
open(F,"$f_in");
my $n  = <F>;
chomp($n);
my $tmpstr = <F>;
chomp($tmpstr);
my @sortedarrA = split(/ /,$tmpstr);
my $m = <F>;
chomp($m);
$tmpstr = <F>;
chomp($tmpstr);
my @sortedarrB = split(/ /,$tmpstr);
close(F);

## first_check
my $merged_first = 0;
my $i = 0;
my $j = 0;
my @newarr = ();
while($j < $m ||  $i  < $n){
if ($sortedarrA[$i] > $sortedarrB[$j]){
	push (@newarr, $sortedarrB[$j]);
	$j++; 
}else{
	push (@newarr, $sortedarrA[$i]);
	$i ++;
}
if ($j == $m) {$sortedarrB[$j] = 9999999999;}
if ($i == $n) {$sortedarrA[$i] = 9999999999;}
}

print "@newarr\n"
