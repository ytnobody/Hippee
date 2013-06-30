package Hippee;
use strict;
use warnings;
use Nephia plugins => ['PocketIO'];

our $VERSION = 0.05;

path '/' => sub {
    my $req = shift;
    return {
        template => 'index.tt',
        title => 'Hippee',
        envname  => config->{envname},
        apppath  => 'lib/' . __PACKAGE__ .'.pm',
    };
};

pocketio 'message' => sub {
    my ($sock, $data) = @_;
    $sock->emit('res', $data->{message});
    $sock->broadcast->emit('res', $data->{message});
};

1;

=head1 NAME

Hippee - Web Application

=head1 SYNOPSIS

  $ plackup

=head1 DESCRIPTION

Hippee is web application based Nephia.

=head1 AUTHOR

clever guy

=head1 SEE ALSO

Nephia

Nephia::View::TT

=head1 LICENSE

This library is free software; you can redistribute it and/or modify
it under the same terms as Perl itself.

=cut
