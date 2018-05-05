#!perl

use 5.008;

use ModPerl::MM ();
use Apache::TestMM qw(test clean);
use Apache::TestRunPerl ();

# configure tests based on incoming arguments
Apache::TestMM::filter_args();

# provide the test harness
Apache::TestRunPerl->generate_script();

ModPerl::MM::WriteMakefile(
    NAME          => 'Apache2::Camelcadedb',
    AUTHOR        => 'Mattia Barbon <mattia@barbon.org>',
    LICENSE       => 'perl',
    VERSION_FROM  => 'lib/Apache2/Camelcadedb.pm',
    ABSTRACT_FROM => 'lib/Apache2/Camelcadedb.pm',
    PREREQ_PM => {
        mod_perl2    => 0,
        'Test::More' => 0,
    },
);
