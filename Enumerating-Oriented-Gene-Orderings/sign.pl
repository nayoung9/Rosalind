#!/usr/bin/perl
#
#
my $n = shift;

my $cnt = 0;
my @ar_all = ();
foreach my $this (1..$n){
	push(@ar_all,$this);
}

foreach my $this (@ar_all){
	foreach my $neg ("","-"){
		my $cur = $neg.$this;
		$cur = int($cur);
		my $used = $this.";";
		my $step = 1;
		permut($used, $cur, $step,$n);
	}
}

sub permut{
	my $used = shift;
	my $cur = shift;
	my $step = shift;
	my $n = shift;

	if ($step == $n){
		print $cur."\n";
		$cnt ++;
	}else{
		my %hs_used= ();
		my @ar_used = split(/;/,$used);
		foreach my $used_rec (@ar_used){
			$hs_used{$used_rec} = 1;
		}
		foreach my $this (1..$n){
			if (!exists($hs_used{$this})){
				foreach my $neg ("","-"){
					my $current_add = $neg.$this;
					my $c_cur .= $cur." ".$current_add;
					my $c_used .= $used.$this.";";
					my $c_step = $step + 1;
					permut($c_used, $c_cur, $c_step,$n);
				}
			}
		}
	}
}

print $cnt."\n";
