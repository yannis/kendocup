Rails.application.routes.draw do


  scope ":locale", locale: /fr|en/ do |locale|
    mount Kendocup::Engine => "/k", as: "k"
    root to: redirect("/#{I18n.locale}/k/cups")
  end


  get '/', to: redirect(I18n.locale.to_s)

  ActiveAdmin.routes(self)
end
