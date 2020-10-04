Rails.application.routes.draw do
	namespace :admin do
	 	devise_for :admins,path: '', controllers: {
	      sessions: 'admin/admins/sessions',
	      registrations: 'admin/admins/registrations',
	      passwords: 'admin/admins/passwords'
	    }
    	root 'admins#top'
    	resources :end_users, only:[:index]
    	resources :items, only:[:index, :show, :edit, :new, :create, :update]
    	resources :genres, only:[:index, :edit, :create, :update]
	end

	scope module: :public do
	  devise_for :end_users, controllers: {
	        sessions: 'public/end_users/sessions',
	        registrations: 'public/end_users/registrations',
	        passwords: 'public/end_users/passwords'
	  	}
	  	root "end_users#top"
	  	resources :end_users do
	  		collection do
	  			get 'unsubscribe'
	  			patch 'withdraw'
	  		end
	  	end
	  	resources :items, only:[:index, :show]
	  	resources :cart_items, only:[:index, :update, :create, :destroy] do
	  		delete 'destroy_all', on: :collection
	  	end
	end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
