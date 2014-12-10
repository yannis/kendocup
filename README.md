# Kendocup

A Rails Engine for organizing Kendo tournaments.

## Installation

In your Gemfile:

    gem "kendocup", github: "yannis/kendocup"

In your application routes.rb

  scope ":locale", locale: /fr|en/ do |locale|
    mount Kendocup::Engine => "/k", as: "k"
    root to: redirect("/#{I18n.locale}/k/cups")
  end


  get '/', to: redirect(I18n.locale.to_s)

  ActiveAdmin.routes(self)

Copy Kendocup db migrations to your app db/migrate directory

  bin/rake kendocup:install:migrations


