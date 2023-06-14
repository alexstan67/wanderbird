Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      get "/airports/find", to: "airports#find"
    end
  end

  scope "(:locale)", locale: /#{I18n.available_locales.join("|")}/ do
    devise_for :users
    get 'pages/console'
    resources :pilot_prefs, only: [ :edit, :update ]
    root to: 'pages#home'
  end
end
