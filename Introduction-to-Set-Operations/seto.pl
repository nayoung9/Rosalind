#!/usr/bin/perl
#
use strict;
use warnings;
my $f_in =shift;
open(F,"$f_in");
my $n = <F>;
my $s1 = <F>;
my $s2 = <F>;
close(F);
chomp($n);
chomp($s1);
chomp($s2);
$s1 =~ s/{//;
$s1 =~ s/}//;
$s2 =~ s/{//;
$s2 =~ s/}//;


my @ar1  = split(/, /,$s1);
my @ar2  = split(/, /,$s2);

my %hs = ();
my %hsa = ();
my %hsb = ();

#setting 
foreach my $val (1..$n){
	$hs{$val} = 0;
}
foreach my $val (@ar1){
	$hs{$val} += 1;
	$hsa{$val}=1;
}
foreach my $val (@ar2){
	$hs{$val} += 1;
	$hsb{$val} = 1;
}

# union
print "{";
my @ar_union = ();
foreach my $val(keys %hs){
	if ($hs{$val} != 0){
		push(@ar_union,$val);
	}
}
@ar_union = sort {$a <=> $b }(@ar_union);
print join(", ", @ar_union)."}\n";

#intersect 
print "{";
my @ar_itst = ();
foreach my $val(keys %hs){
	if ($hs{$val} == 2){
		push(@ar_itst,$val);
	}
}
@ar_itst = sort {$a <=> $b }(@ar_itst);
print join(", ", @ar_itst)."}\n";


#A-B

print "{";
my @ar_diff = ();
foreach my $aval (@ar1){
	if ($hs{$aval}==2){
		next;
	}else{
		push(@ar_diff,$aval);
	}
}
@ar_diff = sort {$a <=> $b }(@ar_diff);
print join(", ", @ar_diff)."}\n";


#B-A

print "{";
@ar_diff = ();
foreach my $bval (@ar2){
	if ($hs{$bval}==2){
		next;
	}else{
		push(@ar_diff,$bval);
	}
}
@ar_diff = sort {$a <=> $b }(@ar_diff);
print join(", ", @ar_diff)."}\n";

#Arest
print "{";
my @ar_rest = ();
foreach my $val(keys %hs){
	if (!exists($hsa{$val})){
		push(@ar_rest,$val);
	}
}
@ar_rest = sort {$a <=> $b }(@ar_rest);
print join(", ", @ar_rest)."}\n";
#Brest
print "{";
@ar_rest = ();
foreach my $val(keys %hs){
	if (!exists($hsb{$val})){
		push(@ar_rest,$val);
	}
}
@ar_rest = sort {$a <=> $b }(@ar_rest);
print join(", ", @ar_rest)."}\n";
