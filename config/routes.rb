Rails.application.routes.draw do
  resources :users do
    member do
      delete :delete_image
    end
  end

  resources :books, only: %i[index show create update destroy] do
    collection do
      post :create_by_multipart_form
    end
  end

  resources :histories

  post '/send_mail/send_recommend', to: 'send_mail#send_recommend', as: 'send_mail'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
