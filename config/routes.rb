Rails.application.routes.draw do
	namespace :admin do
	 	devise_for :admins,path: '', controllers: {
	      sessions: 'admin/admins/sessions',
	      registrations: 'admin/admins/registrations',
	      passwords: 'admin/admins/passwords'
	    }
    	root 'admins#top'
    	resources :end_users, only:[:index]

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
	end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
