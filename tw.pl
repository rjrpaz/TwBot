#!/usr/bin/perl
use strict;
use Mysql;

my $dbhost = 'Database_Host';
my $dbbase = 'Database_Name';
my $dbuser = 'Database_User';
my $dbpass = 'Database_Password';
my $sql_statement = '';
my $sth = '';

# Periodo de tiempo máximo de espera hasta que comienza su ejecución.
my $periodo = 300;

my $random_time = int(rand($periodo));
sleep($random_time);

# Inicializa funciones de Mysql
my $dbh = Mysql->connect($dbhost, $dbbase, $dbuser, $dbpass);
if ((defined(Mysql->errmsg())) && (Mysql->errmsg() ne "")) {
	die "Error al conectar con la base";
}

$sql_statement = "SET names utf8";
$dbh->query($sql_statement);

# Carga nuevos textos
open(NUEVOS, "~/TwBot/rm | ");
while (<NUEVOS>) {
	chomp;
	my $status = $_;
	$status =~ s/\"/\'/g;

	$sql_statement = "INSERT INTO twitter(status) VALUE (\"$status\")";
	$dbh->query($sql_statement);
}
close(NUEVOS);


my $cadena = '';

$sql_statement = "SELECT id, status, hits FROM twitter ORDER BY last LIMIT 1";
$sth = $dbh->query($sql_statement);

my ($id, $status, $hits) = $sth->fetchrow;

$hits++;

$sql_statement = "UPDATE twitter SET hits=$hits,last=NOW() where id = $id";
$dbh->query($sql_statement);

my $comando = "~/TwBot/tw \"$status\"";
system("$comando");

exit(0);

