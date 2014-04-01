Ember::Application.routes.draw do
  scope(:path => '/api') do 
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

    get 'registration.csv', to: 'about#bigdata'
    
    # Support for Legacy Tools
    post 'signup', to: "about#signup"
    get 'bitcamp', to: "about#heartbeat"

    post 'login', to: "session#login"
    get 'logout', to: "session#logout"

    post 'register', to: "session#register"
    put 'profile', to: "profile#update"
    get 'profile', to: "profile#read"

    put 'login/reset', to: "reset#token"
    post 'login/reset', to: "reset#reset"

    post 'hellosign', to: "about#procd"
    get 'hellosign', to: "about#form"

    get 'viewform', to: "about#waiver"
    





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
   
     # g

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
end
