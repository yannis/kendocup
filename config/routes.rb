Kendocup::Engine.routes.draw do
  # devise_for :users, class_name: "Kendocup::User", module: :devise
  # resources :cups

  devise_for :users, class_name: "Kendocup::User", module: :devise

  resources :cups, only: [:index, :show]
  resources :headlines, only: [:index, :show]
  resources :kenshis do
    get :autocomplete_kenshi_club, on: :collection
  end

  resources :participations, only: [:destroy]
  resources :purchases, only: [:destroy]

  resources :teams, only: [:index, :show]

  resources :users, only: [:show] do
    resources :kenshis do
      member do
        get :duplicate, to: 'kenshis#new'
      end
    end
  end

  get 'auth/:provider/callback', to: 'sessions#create'
  get 'auth/failure', to: redirect('/')
  devise_scope :user do
    get 'signout', to: 'devise/sessions#destroy', as: 'signout'
  end

  resource :mailing_list, :only => [:new, :destroy]
  root to: "cups#show"
  get '/', to: redirect(Date.current.year.to_s)

end
