requires 'Nephia' => '0';
requires 'Nephia::View::TT' => '0';
requires 'Nephia::DSLModifier';
requires 'Nephia::Plugin::PocketIO';
requires 'WWW::256locksMaker';
requires 'Cache::LRU';
requires 'Config::Micro';

on build => sub {
    requires 'Test::More';
};

