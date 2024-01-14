#!/usr/bin/perl
#
my $str= shift;
my $len = length($str);

$str =~ tr/ACGT/0123/;
print $str."\n";
my $quar = 0;
my $jisu = 0;
for(my $i = ($len-1); $i>= 0 ; $i -- ){
	my $this = substr($str,$i,1);
	
	$quar += scalar($this)*(4**$jisu);
	$jisu++;
}
print $quar."\n";
