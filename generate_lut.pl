#!/usr/bin/perl

use strict;
my @elements;
my $numberOfElements = 256;
my $numberOfInputBits = 8;
my $numberOfOutputBits = 8;

sub usage {
	print STDERR "Usage: $0 [-h] [-ne <number_of_elements>] [-nob <number_of_output_bits>] [-nib <number_of_input_bits>]\n";
	print STDERR "\n";
	print STDERR "\t-ne <number_of_elements> => Size of the lookup table.  Defaults to 256.\n";
	print STDERR "\t-nob <number_of_output_bits> => Size of the CORDIC output (x and y) in bits.  Defaults to 8.\n";
	print STDERR "\t-nib <number_of_input_bits> => Size of the CORDIC input (phase_in) in bits.  Defaults to 8.\n";
	print STDERR "\t-h => Show this message.\n";
	print STDERR "\n\n";
	exit 1;
}

for($a = 0; $a <= $#ARGV; $a++){
	if($ARGV[$a] eq "-h"){
		usage();
	}elsif($ARGV[$a] eq "-ne"){
		print "Changing the number of elements to ".$ARGV[$a + 1]."\n";
		$numberOfElements = int($ARGV[++$a]);
	}elsif($ARGV[$a] eq "-nob"){
		$numberOfOutputBits = int($ARGV[++$a]);
	}elsif($ARGV[$a] eq "-nib"){
		$numberOfInputBits = int($ARGV[++$a]);
	}
}

# Go through each element in the array to calculate the value
for($a = 0; $a < $numberOfElements; $a++){
	# Keeps track of whether or not to invert the value
	my $inv = 0;
	# Figure out the degree for this element
	my $deg = (360 / $numberOfElements) * $a;
	#print "Deg: $deg\n";
	# Calculate the current degree in radians (0.0174 = 3.14/180)
	my $rad = $deg * 0.0174;
	#print "Rad: $rad\n";
	# When $rad is over 3.14 it needs to be inverted (CORDIC requires this)
	if($rad > 3.14){
		# Subtrace 3.14 from the current radian value
		$rad -= 3.14;
		# Tag this element as needing to be inverted
		$inv = 1;
	}
	# Convert the current value in radians to a string for splitting
	my $string = sprintf("%.3f", $rad)."";
	# Split the whole number from the fractional number
	my ($whole, $frac) = $string =~ /^(\d+)\.(\d+)/;
	# Convert the fractional part to .xxx for math later
	$frac = $frac/1000;
	# Make sure the whole number is an int and not a string
	$whole = $whole * 1.0;
	#print "Whole: $whole   Frac: $frac\n";
	# What to do when the value needs to be inverted
	#
	# The fractional part needs to be multiplied by 2 ^ (numberOfInputBits - 2)  to make the 5 bit
	# vector represent the fractional value.
	my $mult = 2 ** ($numberOfInputBits - 3);
	if($inv == 1){
		# Inverting is done by xoring the fractional and whole bits
		push(@elements, sprintf "%03b%0".($numberOfInputBits - 3)."b", ($whole ^ 0xff) & 0x07, (($frac * $mult) ^ 0xff) & 0x01f);
	}else{
		# No need to invert.  
		push(@elements, sprintf "%03b%0".($numberOfInputBits - 3)."b", $whole, $frac * $mult);
	}
}

print "type points_t is array(0 to ".($numberOfElements-1).") of std_logic_vector(".($numberOfInputBits - 1)." downto 0);\n";
print "constant points : points_t := (\n";

for($a = 0; $a < $numberOfElements; $a++){
	if($a == 0){
		print "\t";
	}elsif($a % 8 == 0){
		print "\n\t";
	}
	print "\"$elements[$a]\",";
}

print "\n);\n";
