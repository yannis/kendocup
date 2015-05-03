Rails.application.routes.draw do

  scope "(:locale)", locale: /fr|en/ do |locale|


    mount Kendocup::Engine => "/"

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

    resource :mailing_list, only: [:new, :destroy]
    root to: "cups#show"
    get '/', to: redirect(Date.current.year.to_s)


    # root to: redirect("/#{I18n.locale}/cups")
  end

  ActiveAdmin.routes(self)

  get '/', to: redirect(I18n.locale.to_s)
end
