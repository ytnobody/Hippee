package Hippee;
use strict;
use warnings;
use Nephia plugins => ['PocketIO'];
use WWW::256locksMaker;
use Cache::LRU;

our $VERSION = 0.05;

my $cache = Cache::LRU->new(size => 32);

sub img_make {
    my $name = shift;
    my $img = $cache->get($name);
    unless ($img) {
        my $nigolox = WWW::256locksMaker->make($name);
        $img = $nigolox->image_url;
        $cache->set($name, $img);
    }
    return $img;
}

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
    my $img = img_make($data->{client});
    my $message = length($data->{message}) > 50 ? substr($data->{message}, 0, 50).'...' : $data->{message};
    $sock->emit('res', $message, $img);
    $sock->broadcast->emit('res', $message, $img);
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
