Rails.application.routes.draw do

  # resources :posts   # Recurso estándar con el que no hace falta definir todas las rutas comentadas de abajo

  resources :posts do
    resources :comments
  end

  root :to => "welcome#index"   # Dirige la página principal a /welcome/index

=begin
  get 'welcome/index'  
 
  get "posts/new"
  post "posts" => "posts#create"
  # get "posts/:id" => "posts#show", :as => :post  # Da error en Rails 4
  patch "posts/:id" => "posts#show", :as => :post
  # La opción :as le dice al método get que queremos hacer que los asistentes de ruteo llamados post_url y post_path 
  # estén disponibles para nuestra aplicación. Éstos son los métodos que form_for necesita cuando estamos editando un artículo 
  # y que ahora están disponibles para actualizar los artículos.
  get "posts" => "posts#index"
  get "posts/:id/edit" => "posts#edit"
  put "posts/:id" => "posts#update"
  delete "posts/:id" => "posts#destroy"
=end
  
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
