#!/usr/bin/perl
#
#
my $in = shift;
open(F,"$in");
my $seq1 = <F>;
my $seq2 = <F>;

close(F);
chomp($seq1);
chomp($seq2);

my $hd = 0;
my $len = length($seq1);
for (my $i = 0 ; $i < $len ; $i ++ ){
	my $a1 = substr($seq1,$i,1);
	my $a2 = substr($seq2,$i,1);
	if($a1 ne $a2){
		$hd ++;
	}
}

print $hd."\n";
