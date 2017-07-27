class RegistrationController < ApplicationController
  require 'mercadopago'
  require 'rubygems'
  require 'json'

  def authorize
    test_local(200)
    return
    token = params[:code]
    # TODO NUESTRA KEY
    mp = MercadoPago.new('TEST-1668116469106489-071315-9ebd7ee8017a2182ea51cd4f26cced33__LC_LA__-264247887')

    authData = {
        client_secret: 'TEST-1668116469106489-071315-9ebd7ee8017a2182ea51cd4f26cced33__LC_LA__-264247887', #NUESTRA KEY
        grant_type: "authorization_code",
        code: token,
        redirect_uri: "https://stark-dawn-82282.herokuapp.com/registration/authorize"
    }

    auth_response = mp.post("/oauth/token", authData)
    handle_response(auth_response)
  end

  def test_local(status)
    @status_response = status
    render "registration/authorize"
  end

  def handle_response(auth_data)
    # todo - check response status, -> error | or 200
    data = auth_data['response']

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

    # TODO hacer pantalla "YA PODES OPERAR CON MP" en vez de redireccionar al pos
    # get_user_key(params[:usr]) o algo asi
    @status_response = auth_data['status']
    render "registration/authorize"
  end

end
