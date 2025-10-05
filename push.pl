#!/usr/bin/perl -w
use strict;

print "Reading comment on modifications made (modifs.txt)\n";
open(M,'modifs.txt');
my $comment=<M>;
chomp($comment);
close(M);

print "Creating a date tag\n";
`date > date.txt`;

#`cp index.html test.html`;

system("git add .");

system("git commit -m \"$comment\"");

system("git push origin main");

my $date=`cat date.txt`;
print "$date";

