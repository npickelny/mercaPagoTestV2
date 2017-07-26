class PaymentController < ApplicationController
  require 'mercadopago'
  require 'rubygems'
  require 'json'

  def index

  end

  #
  def paycheckout

    #TODO DOTENV/secrets para esta clave, Agregar campo para la descripcion

    #CLAVE DEL USER- no la nuestra
    mp = MercadoPago.new('TEST-1668116469106489-071315-9ebd7ee8017a2182ea51cd4f26cced33__LC_LA__-264247887')
    puts params[:input]

    paymentData = {
        transaction_amount: 100,
        "token" => params[:token],
        "description" => "Title of what you are paying for",
        "installments" => 1,
        "payment_method_id" => "visa",
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
    mp = MercadoPago.new('TEST-1668116469106489-071315-9ebd7ee8017a2182ea51cd4f26cced33__LC_LA__-264247887')

    paymentData = Hash[
        "capture" => true
    ]

    payment = mp.put("/v1/payments/"+params[:id], paymentData);

    puts payment
  end

  def cancel_payment


    mp = MercadoPago.new('TEST-1668116469106489-071315-9ebd7ee8017a2182ea51cd4f26cced33__LC_LA__-264247887')

    paymentData = Hash[
        "status" => "cancelled"
    ]

    payment = mp.put("/v1/payments/"+params[:id], paymentData);

    puts payment
  end

  def permit
    # render "payment/permit"
  end

  def pos_backup

  end

  def received_auth
    token = params[:code]
    puts token
    mp = MercadoPago.new('TEST-1668116469106489-071315-9ebd7ee8017a2182ea51cd4f26cced33__LC_LA__-264247887')

    authData = {
      client_secret: 'TEST-1668116469106489-071315-9ebd7ee8017a2182ea51cd4f26cced33__LC_LA__-264247887', #NUESTRA KEY
      grant_type: "authorization_code",
      code: token,
      redirect_uri: "https://www.increasecard.com"
    }

    @auth_response = mp.post("/oauth/token", authData)
    puts @auth_response

    #SETEAR KEYS Y GUARDARLAS EN LA BASE JUNTO CON LA FECHA EN QUE SE PIDIERON
    # render json: @auth_response
    render "payment/pos_backup"
  end

end
