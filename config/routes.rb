Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: "menu_items#index"
  scope '/api' do 
    get '/menu', to: "menu_items#index"
    post '/menu', to: "menu_items#create"
    get "/menu/:id", to: "menu_items#show"
    put "/menu/:id", to: "menu_items#update"
    delete "menu/:id", to: "menu_items#destroy"
    get "/categories", to: "categories#index"
    scope '/auth' do
      post '/sign_up', to: 'users#create' 
      post "/sign_in", to: 'users#sign_in'
    end
    scope '/checkout' do 
      post 'create', to: 'checkout#create', as: 'checkout_create'
      get 'cancel', to: 'checkout#cancel', as: 'checkout_cancel'
      get 'success', to: 'checkout#success', as: 'checkout_success'

    end
  end
end
