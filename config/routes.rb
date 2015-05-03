# Rails.application.routes.draw do
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
      controller: :omniauth_callbacks,
      as: :omniauth_callback,
      via: [:get, :post]

    get 'signout', to: 'devise/sessions#destroy', as: 'signout'
  end
  devise_for  :users, class_name: 'Kendocup::User', module: :devise, except: [:omniauth_callbacks]


end
