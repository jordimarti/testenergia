Testenergia::Application.routes.draw do
  
  get "expert/show_personal_data"
  get "expert/edit_personal_data"
  get "expert/update_personal_data"
  #get "admin/index"
  #get "admin/show"
  #get "admin/edit"
  #get "esdevenir_expert/index"
  #get 'casajuga/index', :to => redirect('/casajuga.html')
  #get "report/print"
  #get "default_improvements/index"
  #get "contacte/index"
  #get "joc/index"
  #get "servei/index"
  #get "improvements/index"
  #get "improvements/show"
  #get "improvements/new"
  #get "improvements/edit"
  #get "improvements/delete"
  #get "xprojects/create_from_project"
  #get "xprojects/show"
  #get "xprojects/new"
  #get "xprojects/edit"
  #get "xprojects/delete"
  #get "projects/index"
  #get "projects/show"
  #get "projects/new"
  #get "projects/edit"
  #get "projects/delete"
  devise_for :admins
  devise_for :experts
  devise_for :users
  #get "autotest/index"
  #get "home/index"

  root "home#index"

  match ':controller(/:action(/:id))', :via => [:get, :post]
  get '/casajuga/', :to => redirect('/casa_juga.html')


  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Example resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end

  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end
