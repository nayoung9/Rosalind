#!/usr/bin/perl
#
#
my $f_in = shift;

open(F,"$f_in");
<F>;
<F>;
my $tmpstr = <F>;
chomp($tmpstr);
my @arr_n = split(/ /,$tmpstr);
$tmpstr = <F>;
chomp($tmpstr);
my @arr_in = split(/ /, $tmpstr);
close(F);

my %hs_arrinfo= ();
my $idx = 1;
foreach my $this (@arr_n){
$hs_arrinfo{$this} = $idx;
$idx ++;
}

foreach my $this (@arr_in){
if (exists($hs_arrinfo{$this})){
	print $hs_arrinfo{$this}." ";
}else{
	print "-1 ";
}
}
