Kaenoheya::Application.routes.draw do

  resources :blogs, only: [:index, :show] do
    resources :blog_comments, except: [:index, :show] do
      #post 'confirm' => 'blog_comments#confirm', on: :collection
    end
  end
  resources :mail_forms, only: [:create]
  resources :updated_informations, only: [:index, :show]
  #resources :versions

  namespace :admin do
    resources :blogs 
    resources :blog_comments
    resources :blog_links
    resources :mail_forms
    resources :updated_informations
    resources :versions do
      post 'update' => 'versions#update', on: :collection
    end
  end

  # The priority is based upon order of creation:
  # first created -> highest priority.

  # Sample of regular route:
  #   match 'products/:id' => 'catalog#view'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  #   match 'products/:id/purchase' => 'catalog#purchase', :as => :purchase
  # This route can be invoked with purchase_url(:id => product.id)

  # Sample resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Sample resource route with options:
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

  # Sample resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Sample resource route with more complex sub-resources
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', :on => :collection
  #     end
  #   end

  # Sample resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end

  # You can have the root of your site routed with "root"
  # just remember to delete public/index.html.
  # root :to => 'welcome#index'
  root :to => 'top#index'

  # The priority is based upon order of creation:
  # first created -> highest priority.
  match "/auth/:provider/callback" => "sessions#callback"
  match "/auth/failure" => "sessions#failure"
  match "/logout" => "sessions#destroy", :as => :logout
  match "/auth/dropbox" => "sessions#callback_dropbox"

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id))(.:format)'
end
