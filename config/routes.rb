Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'application#index'

  get 'todopago/tp_init', :to => 'todopago#init'

  post 'payment/pay_checkout', :to => 'payment#pay_checkout'
  get 'payment/pos_backup', :to => 'payment#pos_backup'

  get  'registration/permit', :to => 'registration#permit'
  get 'registration/authorize', :to => 'registration#authorize'

  get 'todopago/tp_pos_backup', :to => 'todopago#tp_pos_backup'
  get 'todopago/send_auth_req', :to => 'todopago#send_auth_req'
  get 'todopago/payment_status', to: 'todopago#payment_status'
end
