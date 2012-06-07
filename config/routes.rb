Webproje::Application.routes.draw do

	get "/users/about"
	get "sirkets/index"

	post 'users/login'
	post 'users/update_user'
	post 'users/update_card'
	post 'users/bilgilerim'
	post 'users/sifreguncelle'
	post 'users/user_forget'

	get 'users/login'
	get 'users/index'
	get 'users/bilgilerim'
	get 'users/update_user'
	get 'users/anasayfa'
	get 'users/hesap'
	get 'users/forget'

	post 'sirkets/bilgilerim'
	post 'sirkets/update_sirket'
	post 'sirkets/update_sube'
	post 'sirkets/new'
	post 'sirkets/incele'
	post 'sirkets/yeni_urun'
	post 'sirkets/update_urun'

	get 'sirkets/anasayfa'
	get 'sirkets/bilgilerim'
	get 'sirkets/incele'
	get 'sirkets/update_sube'
	get 'sirkets/sube_duzenle'
	get 'sirkets/urun_duzenle'

	post 'admins/update_sirket'
	post 'admins/update_user'
	post 'admins/update_admin'
	post 'admins/new'
	post 'admins/incele'
	get 'admins/incele'
	get 'admins/bilgilerim'
	get 'admins/anasayfa'
	get 'admins/sirket_duzenle'
	get 'admins/user_duzenle'

	root :to => 'users#index'
	resource :users
	resource :sirkets
	resource :admins

	namespace :user do
		root :to => 'users#index'
	end

	match "/signout" => "users#destroy", :as => :signout
  
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

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id))(.:format)'
end
