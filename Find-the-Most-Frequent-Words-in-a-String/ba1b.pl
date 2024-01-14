#!/usr/bin/perl
#
#

my $str = shift;
my $k = shift;

my %hs_cnt = ();
my $len = length($str);
for (my $i = 0 ; $i < $len ; $i ++){
	my $subst = substr($str, $i, $k);
	$hs_cnt{$subst} ++;
}

my %hs_cnt_order = ();
foreach my $subst (keys %hs_cnt){
	$hs_cnt_order{$hs_cnt{$subst}} .= " $subst";
}

foreach my $num (sort {$b <=> $a}  keys %hs_cnt_order){
	print $num." ". $hs_cnt_order{$num};
	last;
}
