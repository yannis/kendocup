Rails.application.routes.draw do

  mount Kendocup::Engine => "/"

  get "/users/sign_out", to: "admin/cups#index"

  # resources :cups, only: [:index, :show]
  # resources :headlines, only: [:index, :show]
  # resources :kenshis do
  #   get :autocomplete_kenshi_club, on: :collection
  # end

  # resources :participations, only: [:destroy]
  # resources :purchases, only: [:destroy]
  # resources :teams, only: [:index, :show]
  # resources :users, only: [:show] do
  #   resources :kenshis do
  #     member do
  #       get :duplicate, to: 'kenshis#new'
  #     end
  #   end
  # end

  # resource :mailing_list, only: [:new, :destroy]
  # get '/', to: redirect(Date.current.year.to_s)



  ActiveAdmin.routes(self)

end
