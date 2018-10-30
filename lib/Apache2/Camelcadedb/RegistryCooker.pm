package Apache2::Camelcadedb::RegistryCooker;

use strict;
use warnings FATAL => 'all';

our $VERSION = '0.01';

use ModPerl::Registry;

sub convert_script_to_compiled_handler {
    my $self = shift;
    my $rc = $self->ModPerl::Registry::convert_script_to_compiled_handler();

    return $rc unless $rc == Apache2::Const::OK;

    {
        my $line_count = ${ $self->{CODE} } =~ tr/\n/\n/;
        no strict 'refs';
        my $glob = *{'::DB::template_handler'};

        if ($glob && *{$glob}{CODE})
        {
            *{$glob}{CODE}->($self->{FILENAME}, { map +($_ => ($_ + 2)), 1 .. $line_count });
        }
    }

    return $rc;
}

1;
__END__
