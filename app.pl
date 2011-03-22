#!/usr/bin/env perl

use Mojolicious::Lite;

use lib 'lib';

plugin 'charset' => {charset => 'utf-8'};
plugin 'tt_renderer';
plugin 'i18n' => {namespace => 'ES::Web::SabadelliDotIt::Edoardo::I18N'};

my $lang = 'en';

app->defaults(
    app => {
        mode => app->mode,
        lang => $lang,
    },
);

get '/edoardo/wedding' => sub {
    my $self = shift;

    if (my $lang = $self->param('lang')) {
        $self->stash->{app}->{lang} = $lang;
    }

    $self->render('index');
};

get '/edoardo/wedding/for-our-friends-from-abroad' => sub {
    my $self = shift;

    if (my $lang = $self->param('lang')) {
        $self->stash->{app}->{lang} = $lang;
    }

    $self->render('information');
};

app->start;
