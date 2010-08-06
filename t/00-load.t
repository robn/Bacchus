#!perl -T

use Test::More tests => 1;

BEGIN {
    use_ok( 'Bacchus' ) || print "Bail out!
";
}

diag( "Testing Bacchus $Bacchus::VERSION, Perl $], $^X" );
