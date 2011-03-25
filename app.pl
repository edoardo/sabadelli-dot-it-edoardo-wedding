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

    _set_language($self);

    $self->render('index');
};

get '/edoardo/wedding/for-our-friends-from-abroad' => sub {
    my $self = shift;

    _set_language($self);

    $self->render('information');
};

app->start;

sub _set_language {
    my $self = shift;

    # take the language based on the users' browser preference
    my $lang = $self->stash->{i18n}->languages();

    # check if a language is forced (via links)
    my $lang_par = $self->param('lang');

    if ($lang_par && $lang_par =~ m{^(en|it)$}) {
        $self->session(lang => $lang_par);
    }

    if (my $lang_session = $self->session('lang')) {
        $lang = $lang_session;

        # set the language in the session as the current one to use
        # for localizing the content
        $self->stash->{i18n}->languages($lang);
    }

    # needed in the templates for setting the lang attribute
    # and for generating the correct links for switching language
    $self->stash->{app}->{lang} = $lang;
}
