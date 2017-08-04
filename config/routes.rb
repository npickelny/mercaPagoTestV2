Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'application#index'

  post 'payment/pay_checkout', :to => 'payment#pay_checkout'
  get 'payment/pos_backup', :to => 'payment#pos_backup'

  get  'registration/permit', :to => 'registration#permit'
  get 'registration/authorize', :to => 'registration#authorize'
  get 'todo_pago/send_auth_req', to: 'todo_pago#send_auth_req'
end
