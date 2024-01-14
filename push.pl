#!/usr/bin/perl -w
use strict;

`date > date.txt`;
`rm .*swp`;
`rm */*swp`;
`rm */*html.bkup`;

#`cp index.html test.html`;

system("git add .");

print "Input comment on modifications made:\n";

my $comment=<STDIN>;
chomp($comment);
system("git commit -m \"$comment\"");

system("git push origin main");

my $date=`cat date.txt`;
print "$date";

