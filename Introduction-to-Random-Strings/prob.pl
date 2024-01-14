#!/usr/bin/perl


my $f_in = shift;
#my $val = shift;
open(F,"$f_in");
my $str = <F>;
my $lst = <F>;
close(F);

chomp($str);
chomp($lst);
print $str."\n";
print $lst."\n";

my @ar_str = split(//,$str);
my @ar_prob = split(/ /,$lst);
foreach my $thisprob (@ar_prob){
my $prob = 0;
my $val = $thisprob;
foreach my $base(@ar_str){
	if ($base eq "A" || $base eq "T"){
		$prob += (log((1-$val)/2)/log(10));
	}else{
		$prob += (log($val/2)/log(10));
	}
	#print $prob."\n";
}
printf("%.3f ", $prob);
}
