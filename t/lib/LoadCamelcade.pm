package LoadCamelcade;

use strict;
use warnings;

use File::Basename qw();

use blib File::Basename::dirname($INC{'LoadCamelcade.pm'});
use Apache2::Camelcadedb remote_host => 'localhost:12345';

1;
