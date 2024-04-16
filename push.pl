#!/usr/bin/perl -w
use strict;

print "Input comment on modifications made:\n";
open(M,'modifs.txt');
my $comment=<M>;
chomp($comment);
close(M);

`date > date.txt`;

#`cp index.html test.html`;

system("git add .");

system("git commit -m \"$comment\"");

system("git push origin main");

my $date=`cat date.txt`;
print "$date";

