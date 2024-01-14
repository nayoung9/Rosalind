#!/usr/bin/perl
#
#
use strict;
use warnings;

my $f_in = shift;


my $print = "";
open(F,"$f_in");
while(<F>){
	chomp;
	my @ar_tmp = split(/_/,$_);
	$print = $_."\n";
	my $id = $ar_tmp[0];
	#	`wget https://rest.uniprot.org/uniprotkb/$id.fasta`;
	my $allstr = "";
	open(FR,"$id.fasta");
	while(<FR>){
		if( $_ =~ /^>/){next;}
		chomp;
		$allstr .=$_;
	}
	close(FR);
	#print $allstr."\n";
	my @ar_tmps = split(//,$allstr);
	my $idx = 0;
	foreach my $CHAR (@ar_tmps){
		if ($CHAR eq "N"){
			my $second = $ar_tmps[$idx+1];
			if ($second eq "P"){$idx ++; next;}
			my $third = $ar_tmps[$idx+2];
			if (!($third eq "S" || $third eq "T")){$idx ++; next;}
			my $fourth = $ar_tmps[$idx+3] ;
			if ($fourth eq "P"){$idx ++; next;}
			my $prt_idx = $idx+1;
			$print .= $prt_idx." ";
			$idx ++;
		}else{$idx ++;next;}
	}
	print $print."\n";
}
close(F);
