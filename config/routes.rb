Kendocup::Engine.routes.draw do

  devise_scope :user do
    providers = Regexp.union(Devise.omniauth_providers.map(&:to_s))
    match 'users/auth/:provider',
      constraints: { provider: providers },
      to: 'omniauth_callbacks#passthru',
      as: :omniauth_authorize,
      via: [:get, :post]

    match 'users/auth/:action/callback',
      constraints: { action: providers },
      to: 'omniauth_callbacks',
      as: :omniauth_callback,
      via: [:get, :post]
  end
  devise_for  :users, class_name: 'Kendocup::User', module: :devise, except: [:omniauth_callbacks]



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

  resource :mailing_list, :only => [:new, :destroy]
  root to: "cups#show"
  get '/', to: redirect(Date.current.year.to_s)

end
