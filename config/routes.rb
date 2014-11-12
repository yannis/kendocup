Kendocup::Engine.routes.draw do
  devise_for :users, class_name: "Kendocup::User", module: :devise
  resources :cups

end
