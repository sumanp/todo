Rails.application.routes.draw do
  devise_for :users
  root 'pages#landing' #TODO: changes routes based on login

  resources :tasks do
    collection do
      patch :sort
    end
  end

end
