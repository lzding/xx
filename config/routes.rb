require 'sidekiq/web'
Rails.application.routes.draw do

  get 'admin/new'

  resources :globals
  resources :components
  resources :plugins
  resources :refs
  resources :phone_models
  get 'root_log/index'
  get 'access_logs' => 'root_log#index'

  resources :tools
  get 'custom_reports/index'
  get 'custom_reports' => 'custom_reports#index'
  get 'failed_top' => 'custom_reports#failed_devices'

  post 'failed_top' => 'custom_reports#failed_devices'

  resources :phones
  resources :customs
  resources :root_files
  devise_for :admins, :skip => [:sessions]
  authenticate :admin do
    mount Sidekiq::Web => '/sidekiq'
  end

  as :admin do
    get '/profile' => 'devise/registrations#edit', :as => 'edit_admin_registration'
    put 'profile' => 'devise/registrations#update', :as => 'admin_registration'
    delete "/logout" => "devise/sessions#destroy", :as => :destroy_admin_session
    get '/login' => 'devise/sessions#new', :as => :new_admin_session
    get '/sign_up' => 'devise/registrations#new', :as => :new_admin_registrations
    post '/login' => 'devise/sessions#create', :as => :admin_session
  end

  namespace :api, :defaults => { :format => 'json' } do
    namespace :v1 do
      resources :phones, :only => [:create, :show, :root_master_callback]
      post 'phones/referer' => 'phones#root_master_callback'
      # post 'add_phones' => 'customs#add'
      post 'w109374a134134adre134123412aedaf' => 'upgrade#show'
      post 'add_phones' => 'phone_models#add_phone'
    end
  end

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
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
