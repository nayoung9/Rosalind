#!/usr/bin/perl
#
use List::MoreUtils qw(uniq);

my $str = shift;
my $k = shift;
my $L = shift;
my $t = shift;
my $allLen = length($str);
my $res = "";
for (my $i = 0 ; $i < $allLen; $i ++){
	my $substr = substr($str, $i, $L);
	$res .= FindCLUMP($t, $substr, $k);
}

my @ar_res = split(/\s+/,$res);
my @uniq = uniq(@ar_res);
my $uniq_res = join(" ",@uniq);
print $uniq_res."\n";


## find clump
sub FindCLUMP {
	my $t = shift;
	my $str = shift;
	my $k = shift;
	my $len = length($str);
	my %hs_substr_cnt = ();
	for (my $i = 0 ; $i < $len ; $i ++){
		my $substr = substr($str, $i, $k);
		$hs_substr_cnt {$substr} ++;
	}

	my $return = "";
	foreach my $subs (keys %hs_substr_cnt){
		if ($hs_substr_cnt{$subs} >= $t){
			$return .= " ".$subs;
		}
	}
	return $return;
}
