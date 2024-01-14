#!/usr/bin/perl
#
#
my $in = shift;
my $all = shift;

my $len = length($all);
my $slen = length ($in);
for (my $i = 0 ; $i < $len ; $i ++){
	my $substr = substr($all,$i, $slen);
	if ($substr eq $in){
		print $i." ";
	}
}
