#!/ust/bin/perl
#
#
my $in = shift;
my $rev = reverse($in);

$rev =~ tr/ACGT/TGCA/;
print $rev."\n";
