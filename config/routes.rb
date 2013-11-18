GfExternalWeb::Application.routes.draw do

  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }
  as :user do
    delete 'sign_out', :to => 'devise/sessions#destroy', :as => :destroy_user_session
  end

  root :to => 'home#index'
  get 'positions' => 'home#positions', :as => :positions

  get 'tracks/:id' => 'track#show'

end
