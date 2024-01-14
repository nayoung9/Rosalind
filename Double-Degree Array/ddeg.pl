#!/usr/bin/perl
#
#
my $f_in = shift;


my @arr_graph = ();

open(F,"$f_in");
my ($node, $edge) = split(/ /,<F>);
chomp($edge);

while(<F>){
	chomp;
	my ($f, $t ) = split(/ /,$_);
	$arr_graph[$f][$t] = 1;
	$arr_graph[$t][$f] = 1;
}
close(F);


foreach my $this (1 .. $node){
	my $sum_deg = 0;
foreach my $i (1 .. $node){
	if (!exists($arr_graph[$this][$i])){next;}
	my $deg = 0;
	foreach my $j (1.. $node){
		if ($j == $i){next;}
		if (exists($arr_graph[$i][$j])){
		$deg++;}
	}
	$sum_deg += $deg;

}
print $sum_deg." ";
}

