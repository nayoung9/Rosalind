#!/usr/bin/perl
#
#
my $f_in = shift;

open(F,"$f_in");
my $str = <F>;
my $int = <F>;
close(F);

chomp($int);
chomp($str);

my @ar_alp = split(/ /,$str);
@ar_alp = sort(@ar_alp);
my $str_updating =  "";

my @ar_tmp = @ar_alp;
my @ar_tmp_new = ();
for ($i = 2 ; $i <= $int ; $i ++){
	@ar_tmp_new = ();
	foreach $cur (@ar_tmp){
		foreach $add (@ar_alp){
			my $new = $cur.$add;
			push(@ar_tmp_new,$new);
		}
	}
	@ar_tmp = @ar_tmp_new;
}

print join("\n",@ar_tmp)."\n";;
