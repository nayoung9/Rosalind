#!/usr/bin/perl
#
#
my $in = shift;
open(F,"$in");
my $str = <F>;
my $str2 = <F>;
chomp($str);
chomp($str2);
my ($k, $d)  = split(/ /,$str2);
close(F);

my $len = length($str);
## get all kmer 
my %hs_save_kmer = ();
my @ar_kmer = ();
for (my $ki = 0 ; $ki <$k ; $ki ++){
	if ($ki == 0 ){
		@ar_kmer = ("A","G","C","T");
	}else{
		my @tmp_ar = ();
		foreach my $this (@ar_kmer){
			foreach my $add ("A","G","C","T"){
				my $new = $this.$add;
				push(@tmp_ar,$new);
			}
		}
		@ar_kmer = @tmp_ar;
	}
}


my %hs_kmer_freq = ();
my %hs_kmer_rcfreq = ();
foreach my $kmer (@ar_kmer){
	my $rckmer = rcGen($kmer);
	for (my $i = 0 ; $i < $len ; $i ++){
		my $check = substr($str, $i, $k);
		my $hd = hdCalc($kmer, $check, $k);
        my $hd2 = hdCalc($rckmer, $check, $k);
		if (!($hd > $d)){
			$hs_kmer_freq{$kmer} ++;
		}
		if (!($hd2 > $d)){
			$hs_kmer_rcfreq{$kmer} ++;
		}
	}
}

my %hs_cnt_collect = ();
foreach my $kmer (keys %hs_kmer_freq){
	$hs_cnt_collect{($hs_kmer_freq{$kmer}+$hs_kmer_rcfreq{$kmer})} .= " $kmer"; 
}

foreach my $cnt (sort {$b <=> $a }keys %hs_cnt_collect){
	print $cnt. "   ";
	print $hs_cnt_collect{$cnt}."\n";
}




sub rcGen{
	my $str = shift;
	my $rev = reverse($str);
	$rev =~ tr/ACGT/TGCA/;
	return $rev;
}
sub hdCalc{
	my $seq1 = shift;
	my $seq2 = shift;
	my $hd = 0;
	my $len = shift;
	for (my $i = 0 ; $i < $len ; $i ++ ){
		my $a1 = substr($seq1,$i,1);
		my $a2 = substr($seq2,$i,1);
		if($a1 ne $a2){
			$hd ++;
		}
	}
	return $hd;
}
