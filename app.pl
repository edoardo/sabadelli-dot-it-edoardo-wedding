#!/usr/bin/env perl

use Mojolicious::Lite;

plugin 'charset' => {charset => 'utf-8'};
plugin 'tt_renderer' => {template_options => {ENCODING => 'utf8'}};
plugin 'i18n' => {namespace => 'ES::Web::SabadelliDotIt::Edoardo::I18N'};

get '/edoardo/wedding' => sub {
  my $self = shift;

  $self->render('index');
};

get '/edoardo/wedding/for-our-friends-from-abroad' => sub {
    my $self = shift;

    $self->render('information');
};

app->start;
