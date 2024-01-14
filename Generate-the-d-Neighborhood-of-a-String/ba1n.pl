#!/usr/bin/perl
#
my $kmer = shift;
my $d = shift;
my $len = length($kmer);

my $kmer_q = $kmer;
$kmer_q =~ tr/ACGT/0123/;

print $kmer."\n";

my $dleft = $d;
foreach (my $i = 0 ; $i < ($len-$d) ; $i ++){
	mismGen($kmer_q,$i,$len,$d,$dleft);
}

sub mismGen{
	my $str= shift;
	my $startFrom = shift;
	my $length_all = shift;
	my $d = shift;
	my $dleft = shift;

	if ($dleft== 0){
		my $print =Trans($str)."\n";
		print $print;
	}else{
		my $cur = substr($str,$startFrom,1);
		foreach my $base (0,1,2,3){
			if ($cur != $base){
				substr($str,$startFrom,1,$base);
				my $dleftIn = $dleft -1;
				mismGen($str,$startFrom+1, $length_all, $d, $dleftIn);
			}
		}
	}
	
}

sub Trans{
	my $idx = shift;
	$idx =~ tr/0123/ACGT/;
	return $idx;
}
