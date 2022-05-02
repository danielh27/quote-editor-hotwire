Rails.application.routes.draw do
  devise_for :users

  root 'pages#home'
  
  resources :quotes do
    resources :item_dates, except: %i[index show]
  end

end
