use strict;
use warnings;
use FindBin;
use Config::Micro;
use File::Spec;

use lib ("$FindBin::Bin/lib", "$FindBin::Bin/extlib/lib/perl5");
use Hippee;
my $config = require( Config::Micro->file( dir => File::Spec->catdir('etc','conf') ) );
Hippee->run( $config );
