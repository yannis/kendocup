Rails.application.routes.draw do


  scope ":locale", locale: /fr|en/ do |locale|
    mount Kendocup::Engine => "/kendocups", as: "kendocup"
  end

  ActiveAdmin.routes(self)
end
