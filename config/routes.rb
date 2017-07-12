Rails.application.routes.draw do
  devise_for :users,path: 'auth',
             path_names: {
                 sign_in:         'login',
                 sign_out:        'logout',
                 password:        'secret',
                 confirmation:    'verification',
                 unlock:          'unblock',
                 registration:    'register',
                 sign_up:         'sign_up'
             }
  root 'welcome#index'
  get 'demo', to: 'welcome#login'
  get 'about', to: 'welcome#about'
  get 'explore', to: 'welcome#not-ready'
end
