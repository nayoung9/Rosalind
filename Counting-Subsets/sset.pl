#!/use/bin/perl
#
#
my $n = shift;
my $ncnt = $n;
my $subsetcnt = 1;
while($ncnt!=0){
$ncnt --;
	$subsetcnt *= 2;
	if ($subsetcnt >1000000){
		$subsetcnt = $subsetcnt % 1000000;
	}
}
print $subsetcnt."\n";
