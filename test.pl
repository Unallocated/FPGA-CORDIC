#!/usr/bin/perl

use strict;
my @elements;
for($a = 0; $a < 256; $a++){
	my $inv = 0;
	my $deg = (360 / 256) * $a;
	print "Deg: $deg\n";
	my $rad = $deg * 0.0174;
	print "Rad: $rad\n";
	if($rad > 3.14){
		$rad -= 3.14;
		$inv = 1;
	}
	my $string = sprintf("%.3f", $rad)."";
	my ($whole, $frac) = $string =~ /^(\d+)\.(\d+)/;
	$frac = $frac/1000;
	$whole = $whole * 1.0;
	print "Whole: $whole   Frac: $frac\n";
	if($inv == 1){
		push(@elements, sprintf "%03b%05b", ($whole ^ 0xff) & 0x07, (($frac * 32) ^ 0xff) & 0x01f);
	}else{
		push(@elements, sprintf "%03b%05b", $whole, ($frac * 32));
	}
}

print "type points_t is array(0 to 255) of std_logic_vector(7 downto 0);\n";
print "constant points : points_t := (\n";

for($a = 0; $a < 256; $a++){
	if($a % 8 == 0){
		print "\n\t";
	}
	print "\"$elements[$a]\",";
}

print "\n);\n";
