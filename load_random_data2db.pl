#!/usr/bin/perl -w
use strict;
use utf8;
use v5.10;

use DBI;
use Data::UUID;

my $ug = Data::UUID->new();

my $records_count = 10;

my $database = "stat_db";
my $dsn      = "DBI:Pg:database=$database";
my $user     = "stat_master";
my $password = "GupGhodHayb1Divunjag4";

my $dbh = DBI->connect($dsn, $user, $password ) or die $DBI::errstr;
$dbh->{RaiseError} = 1;

my $insert_sql = 'INSERT INTO payments ( dt, amount, order_id, user_id ) VALUES ( to_timestamp(?), ?, ?, ? );';

my $sth = $dbh->prepare( $insert_sql );

eval {
    $dbh->begin_work;
    foreach (1..$records_count) {
      my @params = ( rnd_dt(), rnd_amount(), rnd_order(), rnd_user() );
#      use Data::Dumper;say Dumper \@params;
      $sth->execute( @params );
    }
    $dbh->commit;
};
if ($@) {
    warn "Transaction aborted because $@";
    $dbh->rollback;
}

$dbh->disconnect();

sub rnd_dt {
    return 1410423698 + int( rand(3600*24*365) );
}

sub rnd_amount {
    return rand(1000)+1;
}

sub rnd_order {
    return $ug->to_string( $ug->create() );
}

sub rnd_user{
    return int( rand(100)+1 );
}
