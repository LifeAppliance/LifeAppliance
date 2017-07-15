Rails.application.routes.draw do
	resources :posts
	devise_for :users, path: 'auth',
						 path_names: {
								 sign_in: 'login',
								 sign_out: 'logout',
								 password: 'secret',
								 confirmation: 'verification',
								 unlock: 'unblock',
								 registration: 'register',
								 sign_up: 'sign_up'
						 }
	root 'welcome#index'
	get 'demo', to: 'welcome#login'
	get 'about', to: 'welcome#about'
	get 'explore', to: 'welcome#not-ready'

	# ROUTES for API
	# core
	namespace :core	do
		namespace :v1 do
			resources :Posts , :controller => 'posts'
		end
	end
end
