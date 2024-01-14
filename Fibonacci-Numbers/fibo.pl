#!/usr/bin/perl
#
#
my $n = shift;

my $fn = 0;
my $fn_1 = 1;
my $fn_2 = 0;
for (my $i = 0 ; $i <= $n ; $i ++){
	if ($i == 0){$fn = 0;}
	elsif ($i == 1){$fn = 1;}
	else{
		$fn = $fn_1 + $fn_2;
		$fn_2 = $fn_1;
		$fn_1 = $fn;
	}
	print $fn."\n";
	
}
