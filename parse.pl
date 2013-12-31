#!/usr/bin/perl

use strict;

while(<>){
	my $neg = 0;
	s/[\r\n]+//g;
	my ($counter, $phase, $y) = split(" ");
	$phase = oct("0b".$phase);
	if($y =~ /^1/){
		$neg = 1;
	}
	$y = oct("0b".$y);

	if($neg == 1){
		$y ^= 0xff;
		$y = 64 - $y;
	}else{
		$y += 64;
	}
	printf("Counter: %03d Phase: %08d Y: %08d\n", $counter, $phase, $y);
}
