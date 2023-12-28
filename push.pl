#!/usr/bin/perl -w
use strict;

system("git add .");

print "Input comment on modifications made:\n";

my $comment=<STDIN>;
chomp($comment);
system("git commit -m \"$comment\"");

system("git push origin main");

