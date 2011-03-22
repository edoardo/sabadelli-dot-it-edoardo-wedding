#!/usr/bin/env perl

# http://www.sabadelli.it/edoardo/wedding website :)

use Mojolicious::Lite;

use lib 'lib';

plugin 'charset' => {charset => 'utf-8'};
plugin 'tt_renderer';
plugin 'i18n' => {namespace => 'ES::Web::SabadelliDotIt::Edoardo::I18N'};

app->secret('wglisposi!');

app->defaults(
    app => {
        mode => app->mode,
    },
);

get '/edoardo/wedding' => sub {
    my $self = shift;

    my $lang = $self->session('lang');

    if ($self->param('lang')) {
        $lang = $self->param('lang');

        $self->session(lang => $lang);
    }

    $self->stash->{app}->{lang} = $lang || 'en';
    $self->render('index');
};

get '/edoardo/wedding/for-our-friends-from-abroad' => sub {
    my $self = shift;

    my $lang = $self->session('lang');

    if ($self->param('lang')) {
        $lang = $self->param('lang');

        $self->session(lang => $lang);
    }

    $self->stash->{app}->{lang} = $lang || 'en';
    $self->render('information');
};

app->start;
