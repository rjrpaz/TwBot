#!/usr/bin/perl
use strict;
use Mysql;

if ($#ARGV != 0) {
        print <<END;

Uso:
        $0 [status]

Ejemplo:

        $0      "Mensaje de prueba"
END
        exit(0);
}

my $status = $ARGV[0];

my $dbhost = 'Database_Host';
my $dbbase = 'Database_Name';
my $dbuser = 'Database_User';
my $dbpass = 'Database_Password';

my $sql_statement = '';

# Inicializa funciones de Mysql
my $dbh = Mysql->connect($dbhost, $dbbase, $dbuser, $dbpass);
if ((defined(Mysql->errmsg())) && (Mysql->errmsg() ne "")) {
	die "Error al conectar con la base";
}
$sql_statement = "SET names utf8";
$dbh->query($sql_statement);

$status =~ s/\"/\'/g;

$sql_statement = "INSERT INTO twitter(status) VALUE (\"$status\")";
$dbh->query($sql_statement);
