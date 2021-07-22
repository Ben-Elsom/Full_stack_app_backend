Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: "menu_items#index"
  scope '/api' do 
    get '/menu', to: "menu_items#index"
    post '/menu', to: "menu_items#create"
    get "/menu/:id", to: "menu_items#show"
    put "/menu/:id", to: "menu_items#update"
    delete "menu/:id", to: "menu_items#destroy"
    scope '/auth' do
      post '/sign_up', to: 'users#create' 
      post "/sign_in", to: 'users#sign_in'
    end
  end
end
