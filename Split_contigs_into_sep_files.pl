#!/usr/bin/perl -w
use strict;
use Cwd;

my $pwd = cwd();

print $pwd, "\n";

my $dna_file = $ARGV[0];

open(DNA, $dna_file) || die "Cannot find fasta-formatted file, $dna_file $!";

my $idx = rindex($dna_file, '/');  ## get directory path from filename parameter
my $dir = substr($dna_file, 0, $idx);
my $outfolder = substr($dna_file, $idx + 1, length($dna_file) );
$outfolder =~ s/\.fasta//g;

chdir($dir);

my $ndir = cwd();

print $ndir, "\n";

mkdir $outfolder, 0755;

chdir($outfolder);

$ndir = cwd();

print $ndir, "\n";

my $outfile = '';

my $outFH;

while(<DNA>)
 {
   if($_ =~ /^>/)
    {
      close($outFH) if $outFH;
       
      $outfile = $_;
      $outfile =~ s/\s+//g;
      $outfile =~ s/>//g;
      $outfile = $outfile.'.fasta';
      #print $outfile;
      open($outFH, '>', $outfile) || die "Cannot open output file, $outfile $!";
      print $outFH $_;     
    }
 elsif($_ =~ /(A|T|G|C|N)/i)
   {
       print $outFH $_;
   }

   
 }

close $outFH;
close DNA;
