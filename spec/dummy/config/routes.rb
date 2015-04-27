Rails.application.routes.draw do

  scope "(:locale)", locale: /fr|en/ do |locale|
    mount Kendocup::Engine => "/"
    root to: redirect("/#{I18n.locale}/k/cups")
  end



  ActiveAdmin.routes(self)

  get '/', to: redirect(I18n.locale.to_s)
end
