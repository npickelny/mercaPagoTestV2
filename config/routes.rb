Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'payment#index'
  post 'payment/paycheckout', :to => 'payment#paycheckout'
  get  'payment/permit', :to => 'payment#permit'
  get 'payment/pos_backup', :to => 'payment#pos_backup'
  get 'payment/received_auth', :to => 'payment#received_auth'
end
