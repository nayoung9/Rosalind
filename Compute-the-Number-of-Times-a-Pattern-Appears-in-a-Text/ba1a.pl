#!/usr/bin/perl


my $str_from = shift;
my $str_search = shift;

my $cnt = 0;
my $length = length($str_from);
my $s_length = length($str_search);
for (my $i = 0 ; $i < $length ; $i ++){
	my $text = substr($str_from, $i,$s_length);
	if ($text eq $str_search){
		$cnt ++;	
	}
}
print $cnt ."\n";
