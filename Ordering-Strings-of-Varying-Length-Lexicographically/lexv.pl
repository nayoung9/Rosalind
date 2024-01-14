#!/usr/bin/perl
#
#
my $f = shift;
my @ar  = ();
open(F,"$f");
my $list = <F>;
chomp ($list);
@ar = split(/ /, $list);
my $num = <F>;
chomp($num);
close(F);

=p
foreach my $this (@ar){
	print $this."\n";
	foreach my $this1 (@ar){
		print $this.$this1."\n";
		foreach my $this2(@ar){
			print $this.$this1.$this2."\n";
		}
	}
}
=cut

foreach_inside(4,"" ,\@ar);


sub foreach_inside{
	my $int = shift;
	$int --;
	if ($int == 0){return;}
	my $add = shift;
	my @str = @{$_[0]};
	foreach my $this (@str){
		print $add.$this."\n";
		$in = $add.$this;
		foreach_inside($int,$in,\@str);
	}
}
