class TodoPagoController < ApplicationController

  def init
    j_wsdls = {
        #Remoto
        #'Authorize'=> 'https://developers.todopago.com.ar/services/t/1.1/Authorize?wsdl'
        #Local
        'Authorize'=> '../lib/Authorize.wsdl'
    }

    j_header_http = {
        "Authorization"=>"PRISMA f3d8b72c94ab4a06be2ef7c95490f7d3"
    }

    end_point = 'https://developers.todopago.com.ar/'

    connector = TodoPagoConector.new(j_header_http, j_wsdls, end_point) # End Point, wsdl y http_header provisto por TODO PAGO

    # u = TpUser.new(user: {user: "nico_pickelny@hotmail.com",password: "123123" })
    u = TpUser.new("npickelny@gmail.com", "fdsfasdNphl36423919" )
    response = connector.getCredentials(u)

    puts connector
    puts "2222222222222222222222222222222222222222222222222222222222222"
    puts response
    render json: connector
  end

  def tp_pos_backup

  end

  def send_auth_req

    j_wsdls = {
        'Authorize'=> 'https://developers.todopago.com.ar/services/t/1.1/Authorize?wsdl'
    }

    j_header_http = {
        "Authorization"=>"PRISMA A793D307441615AF6AAAD7497A75DE59"
    }

    end_point = 'https://developers.todopago.com.ar/'

    connector = TodoPagoConector.new(j_header_http, j_wsdls, end_point) # End Point, wsdl y http_header provisto por TODO PAGO

    optionsSAR_comercio = Hash.new
    optionsSAR_comercio[:Security]="77c43b88fe5540ffac6df5d7152fa2c9"
    optionsSAR_comercio[:Merchant]= "27372"
    optionsSAR_comercio[:EncodingMethod]="XML"
    optionsSAR_comercio[:URL_OK]="https://stark-dawn-82282.herokuapp.com/ok/"
    optionsSAR_comercio[:URL_ERROR]="https://stark-dawn-82282.herokuapp.com/error/"
    optionsSAR_comercio[:Session]= "ABCDEF-1234-12221-FDE1-00000200"


    optionsSAR_operacion = {
        Merchant: '27372',
        OPERATIONID:'121452145214521452',
        CURRENCYCODE:'32',
        AMOUNT:'2',
        EMAILCLIENTE:'nicolas.pickelny@increasecard.com'

    }
    response = connector.sendAuthorizeRequest(optionsSAR_comercio,optionsSAR_operacion)

    render json: response
  end

  def auth
    u = TpUser.new("email@ejemplo.com", "password1")
    response = conector.getCredentials(u)
  end

end
