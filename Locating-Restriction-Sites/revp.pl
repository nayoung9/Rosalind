#!/usr/bin/perl
#
#
my $f_in = shift;
my $str = "";
open(F,"$f_in");
while(<F>){
	chomp;
	if ($_ =~ /^>/){
	
	}else{
		$str .= $_;
	}
}
close(F);
my @ar = split(//,$str);
my $idx = 0;

for (my $i = 0 ; $i <= $#ar ; $i ++){
	for (my $j = $i+3; $j <= $#ar ; $j +=2){
		my $substr = "";
		for (my $k= $i ; $k <= $j ; $k ++){
			$substr .= $ar[$k];
		}
		#print $substr."\n";
		my $pal = checkPal($substr);
		if ($pal == 1){
			#print $substr."\n";
		}
		my $subslen = length ($substr);
		if ($pal == 1){
			my $printi = $i + 1;
			if ($subslen %2 ==0){
				print "$printi $subslen\n";
			}
		}
	}
}


sub checkPal{
	my $str = shift;
	my $len = length($str);
	my $half = int($len/2);
	my $halfstr = substr($str,0,$half);
	my $reststr = "";
	if ($len % 2 == 0){
		$reststr = substr($str,($len-$half));
		#print $reststr."\n";
	}else{
		#$reststr = substr($str,($len-$half+1));
		return 0;
	}

	my $rev = reverse($halfstr);
	my $revcomp = $rev;
	$revcomp =~ s/A/t/g;
	$revcomp =~ s/T/A/g;
	$revcomp =~ s/t/T/g;
	$revcomp =~ s/C/g/g;
	$revcomp =~ s/G/C/g;
	$revcomp =~ s/g/G/g;
	if ($revcomp eq $reststr){
		return 1;
	}else{
		return 0;
	}
}
