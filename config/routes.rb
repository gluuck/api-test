Rails.application.routes.draw do
  #get 'users/index'
  #get 'users/show'
  #get 'users/new'
  #get 'users/edit'
  #get 'users/create'
  #get 'users/update'
  #get 'users/destroy'
  namespace  :api do
    namespace  :v1 do
      resources  :users
    end
  end
  
end
