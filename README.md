# Kendocup

A Rails Engine for organizing Kendo tournaments.

## Installation

In your Gemfile:

    gem "kendocup", github: "yannis/kendocup"

In your application routes.rb

    mount Kendocup::Engine => "/kendocups", as: "kendocup"

    ActiveAdmin.routes(self)


