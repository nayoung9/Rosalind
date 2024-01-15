#!/usr/bin/perl
#
#

my $in = shift;
my $seq = "";
open(F,"$in");
while(<F>){
	chomp;
	if ($_ =~ /^>/){
		
	}else{
		$seq.=$_;
	
	}
}
close(F);


my $k = 4;
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

my %hs_freq = ();
my $len = length($seq);
for (my $i = 0 ;$i < $len; $i ++){
	my $sstr = substr($seq,$i,4);
	$hs_freq{$sstr} ++;
}

foreach my $km (sort {$a cmp $b } @ar_kmer){
	if (!exists($hs_freq{$km})){
		$hs_freq{$km} = 0;
	}
	print $hs_freq{$km}." ";
}
