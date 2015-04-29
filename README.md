# Kendocup

A Rails Engine for organizing Kendo tournaments.

## Installation

### Create a rails app

- postgres is the only db type supported yet

    rails new your_app_name -d postgresql --skip-test-unit -B

### Change a few files

In your Gemfile:

    gem "kendocup", github: "yannis/kendocup"

and ```bundle``

In your application routes.rb

```
scope ":locale", locale: /fr|en/ do |locale|
  mount Kendocup::Engine => "/""
  root to: redirect("/#{I18n.locale}/cups")
end

get '/', to: redirect(I18n.locale.to_s)

ActiveAdmin.routes(self)
```

In application.rb after ```require "sprockets/railtie"``` add

```
require "prawn"
require "prawn/table"
require "omniauth"
require "omniauth-facebook"
require "activeadmin"
require "figaro"
```

and right before closing ```class Application < Rails::Application``` add

    config.action_mailer.default_url_options = { only_path: true }

You will change this settings once your email settings are available.


### Copy a few files

Copy Kendocup db migrations to your app db/migrate directory

    bin/rake kendocup:install:migrations

### Create your db

    bin/rake db:create

and migrate

    bin/rake db:migrate

fill db with seed data

    Kendocup::Engine.load_seed

    bin/rake db:seed

### Sign in

try to sign in by opening ```/users/sign_in```

- email:    admin@kendocup.com
- password: adminuser

and now go to ```/admin``` you should be in activeadmin

