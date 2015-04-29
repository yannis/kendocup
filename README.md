# Kendocup

A Rails Engine for organizing Kendo tournaments.

## Installation

# Create a rails app

- postgres is the only db type supported yet

    rails new your_app_name -d postgresql --skip-test-unit -B

In your Gemfile:

    gem "kendocup", github: "yannis/kendocup"

In your application routes.rb

```
  scope ":locale", locale: /fr|en/ do |locale|
    mount Kendocup::Engine => "/""
    root to: redirect("/#{I18n.locale}/cups")
  end

  get '/', to: redirect(I18n.locale.to_s)

  ActiveAdmin.routes(self)
``

Copy Kendocup db migrations to your app db/migrate directory

    bin/rake kendocup:install:migrations

Create your db

    bin/rake db:create

and migrate

    bin/rake db:migrate

set in application.rb

    config.action_mailer.default_url_options = { only_path: true }

fill with starting data

    bin/rake db:seed

