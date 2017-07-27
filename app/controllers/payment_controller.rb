class PaymentController < ApplicationController
  require 'mercadopago'
  require 'rubygems'
  require 'json'

  def index

  end

  #Para pagar la transaccion
  #en teoria esto congela la plata nada mas
  def paycheckout

    #TODO DOTENV/secrets para esta clave, Agregar campo para la descripcion
    puts params[:privateAccessToken]

    #CLAVE DEL USER- no la nuestra
    #usrToken = get_user_token_for_checkout(usrId)
    # mp = MercadoPago.new(usrToken)

    #ACCESS TOKEN DEL CLIENTE
    #TODO TOKEN recibido en la auth---permit
    mp = MercadoPago.new('TEST-1668116469106489-071315-9ebd7ee8017a2182ea51cd4f26cced33__LC_LA__-264247887')
    puts params[:input]

    paymentData = {
        transaction_amount: 100,
        "token" => params[:privateAccessToken],
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
      redirect_uri: "https://stark-dawn-82282.herokuapp.com/payment/received_auth"
    }

    # todo - check response status, -> error | or 200

    auth_response = mp.post("/oauth/token", authData)
    handle_response(auth_response)
  end


  private

  def handle_response(auth_data)
    puts auth_data
    data = auth_data['response']

    #todo - hacer un if con el status de respuesta

    if User.find_by(mp_user_id: data['user_id']).nil?
      User.create(
        access_token: data['access_token'],
        public_key: data['public_key'],
        refresh_token: data['refresh_token'],
        mp_user_id: data['user_id'],
        expires_in: data['expires_in'],
        date_keys_obtained: Time.zone.now
      )
    end

    # @key = auth_data["public_key"]
    # TODO GUARDAR KEYS
    # EN LA BASE JUNTO CON LA FECHA EN QUE SE PIDIERON
    # TODO hacer pantalla "YA PODES OPERAR CON MP" en vez de redireccionar al pos
    # get_user_key(params[:usr]) o algo asi
    @status_response = auth_data['status']
    render "payment/auth_response"
  end

  #This sends the userKey to the frontend
  def get_user_key(usrId)
    # token = params[:code]

    #BUSCAR EN LA BASE LA KEY DEL USER Y MANDARLA AL FRONT
    #@key = QUERY BLABLABLA
    render "payment/pos_backup"
  end

  #
  #
  #
  def get_user_token_for_checkout(usrId)
    # token = params[:code]

    #BUSCAR EN LA BASE LA KEY DEL USER Y MANDARLA AL FRONT
    #@token = QUERY BLABLABLA
    #@token
  end

end
