requires 'Nephia' => '0';
requires 'Nephia::View::TT' => '0';
requires 'WWW::256locksMaker';
requires 'Cache::LRU';

on build => sub {
    requires 'Test::More';
};

