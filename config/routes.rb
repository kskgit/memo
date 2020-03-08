Rails.application.routes.draw do
  resources :users do
    member do
      delete :delete_image
    end
  end

  resources :books
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
