class PaymentController < ApplicationController
  require 'mercadopago'
  require 'rubygems'
  require 'json'

  def pos_backup
    @key = User.find_by(mp_user_id: 119579823).public_key
  end

  def pay_checkout
    #TODO DOTENV/secrets para esta clave, Agregar campo para la descripcion
    puts 'card token: ' + params[:token]
    #TODO TOKEN recibido en la auth---permit
    #mp = MercadoPago.new('TEST-1668116469106489-071315-9ebd7ee8017a2182ea51cd4f26cced33__LC_LA__-264247887')

    #ACCESS TOKEN DEL CLIENTE
    user_token = User.find_by(mp_user_id: 119579823).access_token
    puts 'user token: ' + user_token
    mp = MercadoPago.new(user_token)

    puts params[:input]

    paymentData = {
        transaction_amount: params[:amount].to_f,
        "token" => params[:token],
        "description" => "Title of what you are paying for",
        "installments" => params[:installments].to_i,
        "payment_method_id" => params[:paymentMethodId], #visa/master/amex
        "issuer_id" => params[:issuer].to_i,
        "payer" => {
            "email" => params[:email]
        }
    }

    @payment = mp.post("/v1/payments", paymentData);
    puts @payment
    # render json: payment
    render "payment/status"
  end

  def capture_payment
    #TOKEN CLIENTE
    mp = MercadoPago.new('TEST-1668116469106489-071315-9ebd7ee8017a2182ea51cd4f26cced33__LC_LA__-264247887')

    paymentData = Hash[
        "capture" => true
    ]

    payment = mp.put("/v1/payments/"+params[:id], paymentData);

    puts payment
  end

  def cancel_payment
    #TOKEN CLIENTE
    mp = MercadoPago.new('TEST-1668116469106489-071315-9ebd7ee8017a2182ea51cd4f26cced33__LC_LA__-264247887')

    paymentData = Hash[
        "status" => "cancelled"
    ]

    payment = mp.put("/v1/payments/"+params[:id], paymentData);

    puts payment
  end
end
