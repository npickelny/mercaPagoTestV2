#encoding: utf-8

require_relative "Connectors/RestConnector"
require_relative "Connectors/SoapConnector"

$versionTodoPago = '1.7.0'

class TodoPagoConector
  # método inicializar clase
  def initialize(j_header_http, *args)#j_wsdl=nil, endpoint=nil, env=nil
      @discover      = nil
      @Fcv           = nil
      @restConnector = RestConnector.new(j_header_http, args)
      @soapConnector = SoapConnector.new(j_header_http, args)
  end

  def setSoapConnector(soapConnector)
      @soapConnector = soapConnector
  end

  def setRestConnector(restConnector)
      @restConnector = restConnector
  end


  ######################################################################################
  # => Public method that calls first function service sendAuthorizeRequest          ###
  ######################################################################################
  def sendAuthorizeRequest(options_commerce, optionsAuthorize)
    return @soapConnector.sendAuthorizeRequest(options_commerce, optionsAuthorize)
  end

  #####################################################################################
  ###Método público que llama a la segunda funcion del servicio GetAuthorizeAnswer###
  #####################################################################################
  # <b>DEPRECATED:</b> Please use <tt>getAuthorizeAnswer</tt> instead.
  def getAuthorizeRequest(optionsAnwser)
    warn "[DEPRECATION] 'getAuthorizeRequest' is deprecated.  Please use 'getAuthorizeAnswer' instead."
    return getAuthorizeAnswer(optionsAnwser)
  end

  def getAuthorizeAnswer(optionsAnwser)
    return @soapConnector.getAuthorizeAnswer(optionsAnwser)
  end

  ############################################################
  ###Método público que retorna el status de una operacion###
  ############################################################
  def getOperations(optionsOperations)
    return @restConnector.getOperations(optionsOperations)
  end

  ################################################################
  ###Método público que descubre todas las promociones de pago###
  ################################################################
  def getAllPaymentMethods(optionsPaymentMethod)
    return @restConnector.getAllPaymentMethods(optionsPaymentMethod)
  end

  ##############################################################################
  ###Método público que descubre todas las operaciones en un rango de fechas###
  ##############################################################################
  ##$url = $this->end_point.TODOPAGO_ENDPOINT_TENATN.'api/Operations/GetByRangeDateTime/MERCHANT/'. $arr_datos["MERCHANT"] . '/STARTDATE/' . $arr_datos["STARTDATE"] . '/ENDDATE/' . $arr_datos["ENDDATE"] . '/PAGENUMBER/' . $arr_datos["PAGENUMBER"];
  def getByRangeDateTime(optionsGetByRange)
    return @restConnector.getByRangeDateTime(optionsGetByRange)
  end

  ##############################################################################
  ###Devolución                                                              ###
  ##############################################################################
  def returnRequest(refoundOptions)
    return @soapConnector.returnRequest(refoundOptions)
  end

  def voidRequest(refoundOptions)
    message = {
      Security: refoundOptions[:Security],
      Merchant: refoundOptions[:Merchant],
      RequestKey: refoundOptions[:RequestKey],
    }

    client = TodoPagoConector.getClientSoap($j_wsdls['Authorize'], 'Authorize')
    response= client.call(:void_request, message:message)
    resp = response.hash
    return resp.to_json
  end

  ########################################################################
  ### GETCREDENTIALS######################################################
  ########################################################################
  def getCredentials(user)
    return @restConnector.getCredentials(user)
  end

  ######################################################
  ###Methodo público que descubre los metodos de pago###
  ######################################################
  def discoverPaymentMethods()
    return @restConnector.discoverPaymentMethods();
  end

  ##############################################################################
  ###Método público que verifica el estado de los servicios de TodoPago      ###
  ##############################################################################
  def healthCheck()
    result = (echoService("EchoServiceDSS") and echoService("EchoServiceESB"))
    return result
  end

  protected
  def echoService(serviceName)
    return @soapConnector.echoService(serviceName)
  end

end


