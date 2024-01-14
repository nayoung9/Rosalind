#!/usr/bin/perl
#
#
my $f_in = shift;
open(F,"$f_in");
my $str = <F>;
chomp($str);
my $k = <F>;
chomp($k);
close(F);

my @ar_kmer = ();
my %hs_kmer_freq = ();
for (my $ki = 0 ; $ki <$k ; $ki ++){
	if ($ki == 0 ){
		@ar_kmer = ("A","G","C","T");
	}else{
		my @tmp_ar = ();
		foreach my $this (@ar_kmer){
			foreach my $add ("A","G","C","T"){
				my $new = $this.$add;
				push(@tmp_ar,$new);
				if ($ki == $k-1){
					$hs_kmer_freq{$new}=0;
				}
			}
		}
		@ar_kmer = @tmp_ar;
	}
}


my $length = length($str);
for(my $i = 0 ; $i <=($length-$k) ; $i ++){
	my $km = substr($str,$i,$k);
	$hs_kmer_freq{$km} ++;

}

foreach my $this (sort {$a cmp $b} keys %hs_kmer_freq){
	print $hs_kmer_freq{$this}." ";

}
