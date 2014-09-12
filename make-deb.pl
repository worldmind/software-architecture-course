#!/usr/bin/perl -w
use strict;
use v5.10;
use IPC::Run3;

my $out;

run3( ['/usr/bin/du', '-s', '-b', './uwsgi-stat-example/'], undef, \$out);

$out =~ m/(\d+)/;
my $size = $1;

system( q{perl -i -pe 's/Installed-Size: \d+/Installed-Size: } . $size . q{/g' uwsgi-stat-example/DEBIAN/control} );

system( 'find uwsgi-stat-example/opt/ uwsgi-stat-example/etc/ -type f -exec md5sum {} ";" > uwsgi-stat-example/DEBIAN/md5sums' );

system( 'dpkg-deb -b uwsgi-stat-example/' );
