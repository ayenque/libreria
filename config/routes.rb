Rails.application.routes.draw do
  
  resources :books do
    member do
      get :delete
    end
  end


  resources :authors do
    member do
      get :delete
    end
  end


 # get 'authors/index'
 # get 'authors/show'
 # get 'authors/new'  #create
 # get 'authors/edit'  #update
 # get 'authors/delete' #destroy

  root 'books#index' #carga por defecto   
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
