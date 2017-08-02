#encoding: utf-8

class DataProvider

	def getHeader
		return {
		    'Authorization'=>'TODOPAGO ABCDEF1234567890'
		}
	end

	#### SAR 
	def sendAuthorizeRequestOptions(test_condition)


		optionsSAR_operacion = Hash.new
		optionsSAR_operacion[:MERCHANT] = "2153"
		optionsSAR_operacion[:OPERATIONID] = "8000"
		optionsSAR_operacion[:CURRENCYCODE] = "032"
		optionsSAR_operacion[:AMOUNT] = "1.00"

		#Control de Fraude
		optionsSAR_operacion[:CSBTCITY]="Villa General Belgrano"
		optionsSAR_operacion[:CSBTCOUNTRY]= "AR"
		optionsSAR_operacion[:CSBTEMAIL]= "todopago@hotmail.com"
		optionsSAR_operacion[:CSBTFIRSTNAME]= "Juan"
		optionsSAR_operacion[:CSBTLASTNAME]= "Peréz"
		optionsSAR_operacion[:CSBTPHONENUMBER]= "541160913988"     
		optionsSAR_operacion[:CSBTPOSTALCODE]= " 1010"
		optionsSAR_operacion[:CSBTSTATE]= "B"
		optionsSAR_operacion[:CSBTSTREET1]= "Cerrito 740"

		optionsSAR_operacion[:CSBTCUSTOMERID]= "453458"
		optionsSAR_operacion[:CSBTIPADDRESS]= "192.0.0.4"       
		optionsSAR_operacion[:CSPTCURRENCY]= "ARS"
		optionsSAR_operacion[:CSPTGRANDTOTALAMOUNT]= "10.01"
		optionsSAR_operacion[:CSMDD6]= ""
		optionsSAR_operacion[:CSMDD7]= ""
		optionsSAR_operacion[:CSMDD8]= ""       
		optionsSAR_operacion[:CSMDD9]= ""       
		optionsSAR_operacion[:CSMDD10]= ""      
		optionsSAR_operacion[:CSMDD11]= ""

		optionsSAR_operacion[:CSSTCITY]= "Villa General Belgrano"
		optionsSAR_operacion[:CSSTCOUNTRY]= "AR"
		optionsSAR_operacion[:CSSTEMAIL]= "some@someurl.com"
		optionsSAR_operacion[:CSSTFIRSTNAME]= "Juan"
		optionsSAR_operacion[:CSSTLASTNAME]= "Perez"
		optionsSAR_operacion[:CSSTPHONENUMBER]= "541160913988"
		optionsSAR_operacion[:CSSTPOSTALCODE]= " 1010"
		optionsSAR_operacion[:CSSTSTATE]= "B"
		optionsSAR_operacion[:CSSTSTREET1]= "Cerrito 740"

		optionsSAR_operacion[:CSITPRODUCTCODE]= "electronic_good"
		optionsSAR_operacion[:CSITPRODUCTDESCRIPTION]= "Test Prd Description "     
		optionsSAR_operacion[:CSITPRODUCTNAME]= "TestPrd"  
		optionsSAR_operacion[:CSITPRODUCTSKU]= "SKU1234"
		optionsSAR_operacion[:CSITTOTALAMOUNT]= "10.01"
		optionsSAR_operacion[:CSITQUANTITY]= "1"
		optionsSAR_operacion[:CSITUNITPRICE]= "10.01"

		optionsSAR_operacion[:CSMDD12]= ""     
		optionsSAR_operacion[:CSMDD13]= ""     
		optionsSAR_operacion[:CSMDD14]= ""      
		optionsSAR_operacion[:CSMDD15]= ""        
		optionsSAR_operacion[:CSMDD16]= ""

		#Fin Control de Fraude

		#Optionals
		optionsSAR_operacion[:AVAILABLEPAYMENTMETHODSIDS]= "1#194#43#45"
		optionsSAR_operacion[:PUSHNOTIFYMETHOD]= ""
		optionsSAR_operacion[:PUSHNOTIFYENDPOINT]= ""  
		optionsSAR_operacion[:PUSHNOTIFYSTATES]= ""
		optionsSAR_operacion[:MININSTALLMENTS]= "1"
		optionsSAR_operacion[:MAXINSTALLMENTS]= "6"

		optionsSAR_comercio = Hash.new
		optionsSAR_comercio[:security]="1234567890ABCDEF1234567890ABCDEF"
		optionsSAR_comercio[:MERCHANT]= "2153"
		optionsSAR_comercio[:EncodingMethod]="XML"
		optionsSAR_comercio[:URL_OK]= "http://someurl.com/ok/"
		optionsSAR_comercio[:URL_ERROR]= "http://someurl.com/error/"
		optionsSAR_comercio[:EMAILCLIENTE]= "mail@someurl.com"
		optionsSAR_comercio[:Session]= "ABCDEF-1234-12221-FDE1-00000200"


		case test_condition 
		when '702'
			optionsSAR_operacion[:MERCHANT] = "4444"
		when 'fail_required' 
			optionsSAR_operacion[:CSBTEMAIL]= '';				
		end

		options = { optionsSAR_comercio: optionsSAR_comercio, optionsSAR_operacion: optionsSAR_operacion }

		return options

	end	

	def sendAuthorizeRequestSoapRequestOK	
		return {Security:"1234567890ABCDEF1234567890ABCDEF", Merchant:"2153", EncodingMethod:"XML", URL_OK:"http://someurl.com/ok/", URL_ERROR:"http://someurl.com/error/", EMAILCLIENTE:"mail@someurl.com", Session:"ABCDEF-1234-12221-FDE1-00000200", Payload:"<Request><MERCHANT>2153</MERCHANT><OPERATIONID>8000</OPERATIONID><CURRENCYCODE>032</CURRENCYCODE><AMOUNT>1.00</AMOUNT><CSBTCITY>Villa General Belgrano</CSBTCITY><CSBTCOUNTRY>AR</CSBTCOUNTRY><CSBTEMAIL>todopago@hotmail.com</CSBTEMAIL><CSBTFIRSTNAME>Juan</CSBTFIRSTNAME><CSBTLASTNAME>Peréz</CSBTLASTNAME><CSBTPHONENUMBER>541160913988</CSBTPHONENUMBER><CSBTPOSTALCODE> 1010</CSBTPOSTALCODE><CSBTSTATE>B</CSBTSTATE><CSBTSTREET1>Cerrito 740</CSBTSTREET1><CSBTCUSTOMERID>453458</CSBTCUSTOMERID><CSBTIPADDRESS>192.0.0.4</CSBTIPADDRESS><CSPTCURRENCY>ARS</CSPTCURRENCY><CSPTGRANDTOTALAMOUNT>10.01</CSPTGRANDTOTALAMOUNT><CSMDD6></CSMDD6><CSMDD7></CSMDD7><CSMDD8></CSMDD8><CSMDD9></CSMDD9><CSMDD10></CSMDD10><CSMDD11></CSMDD11><CSSTCITY>Villa General Belgrano</CSSTCITY><CSSTCOUNTRY>AR</CSSTCOUNTRY><CSSTEMAIL>some@someurl.com</CSSTEMAIL><CSSTFIRSTNAME>Juan</CSSTFIRSTNAME><CSSTLASTNAME>Perez</CSSTLASTNAME><CSSTPHONENUMBER>541160913988</CSSTPHONENUMBER><CSSTPOSTALCODE> 1010</CSSTPOSTALCODE><CSSTSTATE>B</CSSTSTATE><CSSTSTREET1>Cerrito 740</CSSTSTREET1><CSITPRODUCTCODE>electronic_good</CSITPRODUCTCODE><CSITPRODUCTDESCRIPTION>Test Prd Description </CSITPRODUCTDESCRIPTION><CSITPRODUCTNAME>TestPrd</CSITPRODUCTNAME><CSITPRODUCTSKU>SKU1234</CSITPRODUCTSKU><CSITTOTALAMOUNT>10.01</CSITTOTALAMOUNT><CSITQUANTITY>1</CSITQUANTITY><CSITUNITPRICE>10.01</CSITUNITPRICE><CSMDD12></CSMDD12><CSMDD13></CSMDD13><CSMDD14></CSMDD14><CSMDD15></CSMDD15><CSMDD16></CSMDD16><AVAILABLEPAYMENTMETHODSIDS>1#194#43#45</AVAILABLEPAYMENTMETHODSIDS><PUSHNOTIFYMETHOD></PUSHNOTIFYMETHOD><PUSHNOTIFYENDPOINT></PUSHNOTIFYENDPOINT><PUSHNOTIFYSTATES></PUSHNOTIFYSTATES><MININSTALLMENTS>1</MININSTALLMENTS><MAXINSTALLMENTS>6</MAXINSTALLMENTS></Request>"}    
    end

    def sendAuthorizeRequestSoapResponseOK      
		return '{"envelope":{"body":{"send_authorize_request_response":{"status_code":"-1","status_message":"Solicitud de Autorizacion Registrada","url_request":"https://developers.todopago.com.ar/formulario/commands?command=formulario&m=t703140ec-01dd-9de1-cc38-eb94f234213e","request_key":"2a4bcd0f-6bed-fe3b-84e6-b6e652738898","public_request_key":"t703140ec-01dd-9de1-cc38-eb94f234213e","@xmlns:api":"http://api.todopago.com.ar"}},"@xmlns:env":"http://schemas.xmlsoap.org/soap/envelope/","@xmlns:xsd":"http://www.w3.org/2001/XMLSchema","@xmlns:ns":"http://api.todopago.com.ar","@xmlns:xsi":"http://www.w3.org/2001/XMLSchema-instance"}}'
    end


    def sendAuthorizeRequestSoapFail702
    	return '{"envelope":{"body":{"send_authorize_request_response":{"status_code":"702","status_message":"Cuenta de vendedor invalida","@xmlns:api":"http://api.todopago.com.ar"}},"@xmlns:env":"http://schemas.xmlsoap.org/soap/envelope/","@xmlns:xsd":"http://www.w3.org/2001/XMLSchema","@xmlns:ns":"http://api.todopago.com.ar","@xmlns:xsi":"http://www.w3.org/2001/XMLSchema-instance"}}'
    end

	def sendAuthorizeRequestSoapFailRequired
    	return '{"envelope":{"body":{"send_authorize_request_response":{"status_code":"98005","status_message":"El campo CSBTEMAIL es obligatorio. (Min Length 1)","@xmlns:api":"http://api.todopago.com.ar"}},"@xmlns:env":"http://schemas.xmlsoap.org/soap/envelope/","@xmlns:xsd":"http://www.w3.org/2001/XMLSchema","@xmlns:ns":"http://api.todopago.com.ar","@xmlns:xsi":"http://www.w3.org/2001/XMLSchema-instance"}}'
    end


    #### GAA
    def GetAuthorizeAnswerOptions(test_condition)
    	optionsAnwser=Hash.new
		optionsAnwser[:security]= "f3d8b72c94ab4a06be2ef7c95490f7d3"
		optionsAnwser[:MERCHANT]= "2153"
		optionsAnwser[:RequestKey]= "710268a7-7688-c8bf-68c9-430107e6b9da"
		optionsAnwser[:AnswerKey]= "693ca9cc-c940-06a4-8d96-1ab0d66f3ee6"

		case test_condition 
		when '702'
			optionsAnwser[:MERCHANT] = "4444"
		when 'fail_required' 
			optionsAnwser[:RequestKey]= '';				
		end

    	return optionsAnwser
    end

    def GetAuthorizeAnswerRequestOK
    	return {Security:"f3d8b72c94ab4a06be2ef7c95490f7d3", Merchant:"2153", RequestKey:"710268a7-7688-c8bf-68c9-430107e6b9da", AnswerKey:"693ca9cc-c940-06a4-8d96-1ab0d66f3ee6"}
    end

    def GetAuthorizeAnswerResponseOK
    	return '{"envelope":{"body":{"get_authorize_answer_response":{"status_code":"-1","status_message":"APROBADA","authorization_key":"cc1e3882-56c3-791b-0d68-440b2a853119","encoding_method":"XML","payload":{"answer":{"datetime":"2017-05-10T14:04:51+00:00","currencyname":"Peso Argentino","paymentmethodname":"AMEX","ticketnumber":"12","authorizationcode":"654327","cardnumbervisible":"37641123XXXXX1007","barcode":null,"operationid":"12","couponexpdate":null,"couponsecexpdate":null,"couponsubscriber":null,"barcodetype":null,"associateddocumentation":null,"installmentpayments":"1","operationnumber":"50129213","@xmlns":"http://api.todopago.com.ar"},"request":{"merchant":"2153","operationid":"12","amount":"54.00","currencycode":"32","amountbuyer":"54.00","bankid":null,"promotionid":"2807","@xmlns":"http://api.todopago.com.ar"}},"@xmlns:api":"http://api.todopago.com.ar"}},"@xmlns:env":"http://schemas.xmlsoap.org/soap/envelope/","@xmlns:xsd":"http://www.w3.org/2001/XMLSchema","@xmlns:ns":"http://api.todopago.com.ar","@xmlns:xsi":"http://www.w3.org/2001/XMLSchema-instance"}}'
    end

    def GetAuthorizeAnswerResponseFail
    	return '{"envelope":{"body":{"get_authorize_answer_response":{"status_code":"404","status_message":"ERROR: Transaccion Enexistente","@xmlns:api":"http://api.todopago.com.ar"}},"@xmlns:env":"http://schemas.xmlsoap.org/soap/envelope/","@xmlns:xsd":"http://www.w3.org/2001/XMLSchema","@xmlns:ns":"http://api.todopago.com.ar","@xmlns:xsi":"http://www.w3.org/2001/XMLSchema-instance"}}'
    end

    def GetAuthorizeAnswerResponse702
    	return '{"envelope":{"body":{"get_authorize_answer_response":{"status_code":"702","status_message":"Cuenta de Vendedor Invalida","@xmlns:api":"http://api.todopago.com.ar"}},"@xmlns:env":"http://schemas.xmlsoap.org/soap/envelope/","@xmlns:xsd":"http://www.w3.org/2001/XMLSchema","@xmlns:ns":"http://api.todopago.com.ar","@xmlns:xsi":"http://www.w3.org/2001/XMLSchema-instance"}}'
    end

    ### GET OPERATIONS 
    def GetOperationsOptions(test_condition)
    	optionsOperations = Hash.new
    	optionsOperations[:MERCHANT] = "2153"
    	optionsOperations[:OPERATIONID] = "185"
    	if test_condition == 'fail'
    		optionsOperations[:MERCHANT] = "4444"
    	end
    	return optionsOperations
    end

    def GetOperationsRequestOk
    	return 'https://developers.todopago.com.ar/t/1.1/api/Operations/GetByOperationId/MERCHANT/2153/OPERATIONID/185'
    end

    def GetOperationsResponseOK
    	return '<OperationsColections xmlns="http://api.todopago.com.ar"><Operations><RESULTCODE>-1</RESULTCODE><RESULTMESSAGE>APROBADA</RESULTMESSAGE><DATETIME>2016-09-01T12:09:35.880-03:00</DATETIME><OPERATIONID>185</OPERATIONID><CURRENCYCODE>32</CURRENCYCODE><AMOUNT>3.00</AMOUNT><FEEAMOUNT>0.12</FEEAMOUNT><TAXAMOUNT>0.03</TAXAMOUNT><SERVICECHARGEAMOUNT xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xsi:nil="true"></SERVICECHARGEAMOUNT><CREDITEDAMOUNT>2.85</CREDITEDAMOUNT><AMOUNTBUYER>3.00</AMOUNTBUYER><FEEAMOUNTBUYER xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xsi:nil="true"></FEEAMOUNTBUYER><TAXAMOUNTBUYER xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xsi:nil="true"></TAXAMOUNTBUYER><CREDITEDAMOUNTBUYER>3.00</CREDITEDAMOUNTBUYER><BANKID>18</BANKID><PROMOTIONID>148047</PROMOTIONID><TYPE>compra_online</TYPE><INSTALLMENTPAYMENTS>1</INSTALLMENTPAYMENTS><CUSTOMEREMAIL>elenagaivironsky@hotmail.com</CUSTOMEREMAIL><IDENTIFICATIONTYPE>DNI</IDENTIFICATIONTYPE><IDENTIFICATION>13415824</IDENTIFICATION><CARDNUMBER>45097901XXXXXX5600</CARDNUMBER><CARDHOLDERNAME>Mauricio Ghiorzi</CARDHOLDERNAME><TICKETNUMBER>5190</TICKETNUMBER><AUTHORIZATIONCODE>004675</AUTHORIZATIONCODE><BARCODE xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xsi:nil="true"></BARCODE><COUPONEXPDATE xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xsi:nil="true"></COUPONEXPDATE><COUPONSECEXPDATE xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xsi:nil="true"></COUPONSECEXPDATE><COUPONSUBSCRIBER xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xsi:nil="true"></COUPONSUBSCRIBER><PAYMENTMETHODCODE>42</PAYMENTMETHODCODE><PAYMENTMETHODNAME>VISA</PAYMENTMETHODNAME><PAYMENTMETHODTYPE>Crédito</PAYMENTMETHODTYPE><REFUNDED>2016-09-01T15:29:28.500-03:00</REFUNDED><PUSHNOTIFYMETHOD xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xsi:nil="true"></PUSHNOTIFYMETHOD><PUSHNOTIFYENDPOINT xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xsi:nil="true"></PUSHNOTIFYENDPOINT><PUSHNOTIFYSTATES xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xsi:nil="true"></PUSHNOTIFYSTATES><IDCONTRACARGO>0</IDCONTRACARGO><FECHANOTIFICACIONCUENTA xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xsi:nil="true"></FECHANOTIFICACIONCUENTA><ESTADOCONTRACARGO xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xsi:nil="true"></ESTADOCONTRACARGO><COMISION>0.12</COMISION><REFUNDS><REFUND><ID>3788872</ID><AMOUNT>3.00</AMOUNT><DATETIME>2016-09-01T15:29:28.800-03:00</DATETIME></REFUND></REFUNDS></Operations></OperationsColections>'
    end

    def GetOperationsResponseFail
    	return '<OperationsColections xmlns="http://api.todopago.com.ar"><Status>702</Status></OperationsColections>'
    end	

    ### RESTURN REQUEST
    def GetReturnOptions(test_condition)
    	optionRR=Hash.new
		optionRR[:Merchant] = "2153"
		optionRR[:Security] = "f3d8b72c94ab4a06be2ef7c95490f7d3"
		optionRR[:RequestKey] = "710268a7-7688-c8bf-68c9-430107e6b9da"
		optionRR[:AMOUNT] = "1"

		case test_condition 
		when '702'
			optionRR[:Merchant] = "4444"
		when 'fail' 
			optionRR[:RequestKey]= '11111111111111';				
		end

    	return optionRR
    end

    def GetReturnRequestRequestOK 
    	return {:Security=>"f3d8b72c94ab4a06be2ef7c95490f7d3", :Merchant=>"2153", :RequestKey=>"710268a7-7688-c8bf-68c9-430107e6b9da", :AMOUNT=>"1"}
    end 

    def GetReturnRequestResponseOK
    	return '{"envelope":{"body":{"return_response":{"status_code":"2011","status_message":"Devolucion OK","authorization_key":"a61de00b-c118-2688-77b0-16dbe5799913","authorizationcode":"654402","@xmlns:api":"http://api.todopago.com.ar"}},"@xmlns:env":"http://schemas.xmlsoap.org/soap/envelope/","@xmlns:xsd":"http://www.w3.org/2001/XMLSchema","@xmlns:ns":"http://api.todopago.com.ar","@xmlns:xsi":"http://www.w3.org/2001/XMLSchema-instance"}}'
    end 

    def GetReturnRequestResponseFail
    	return '{"envelope":{"body":{"return_response":{"status_code":"2013","status_message":"No es posible obtener los importes de las comisiones para realizar la devolucion","authorization_key":null,"authorizationcode":null,"@xmlns:api":"http://api.todopago.com.ar"}},"@xmlns:env":"http://schemas.xmlsoap.org/soap/envelope/","@xmlns:xsd":"http://www.w3.org/2001/XMLSchema","@xmlns:ns":"http://api.todopago.com.ar","@xmlns:xsi":"http://www.w3.org/2001/XMLSchema-instance"}}'
    end

    def GetReturnRequestResponseFail702
    	return '{"envelope":{"body":{"return_response":{"status_code":"702","status_message":"ERROR: Cuenta Inexistente","authorization_key":null,"authorizationcode":null,"@xmlns:api":"http://api.todopago.com.ar"}},"@xmlns:env":"http://schemas.xmlsoap.org/soap/envelope/","@xmlns:xsd":"http://www.w3.org/2001/XMLSchema","@xmlns:ns":"http://api.todopago.com.ar","@xmlns:xsi":"http://www.w3.org/2001/XMLSchema-instance"}}'
    end

    ### GET CREDENTIALS
    def GetCredentialsOptions(test_condition)
    	params = {user:'mail@todopago.com', password:'Password1'}
    	case test_condition 
		when 'failUser'
			params[:user] = "aaaa@bbbb.com"
		when 'failPassword' 
			params[:password]= 'aaaaaa';				
		end

    	return params 

    end

    def GetCredentialsResponseOK
    	return '{"Credentials":{"codigoResultado":1,"resultado":{"codigoResultado":0,"mensajeKey":null,"mensajeResultado":"Aceptado"},"merchantId":2153,"APIKey":"TODOPAGO f3d8b72c94ab4a06be2ef7c95490f7d3"}}'
    end

    def GetCredentialsResponseFailUser
    	return '{"Credentials":{"codigoResultado":1,"resultado":{"codigoResultado":1050,"mensajeKey":1050,"mensajeResultado":"Este usuario no se encuentra registrado. Revisá la información indicada o registrate."},"merchantId":null,"APIKey":null}}'
    end

    def GetCredentialsResponseFailPassword
    	return '{"Credentials":{"codigoResultado":1,"resultado":{"codigoResultado":1055,"mensajeKey":1055,"mensajeResultado":"La contraseña ingresada es incorrecta. Revisala."},"merchantId":null,"APIKey":null}}'
    end


    ### DiscoverPaymentMethods
    def discoverPaymentMethodsResponseOK
    	return '<PaymentMethodsCollection xmlns="http://api.todopago.com.ar"><PaymentMethod><ID>1</ID><Logo>http://10.123.4.121:8092/images/AMEX.png</Logo><Name>AMEX</Name></PaymentMethod><PaymentMethod><ID>2</ID><Logo>http://10.123.4.121:8092/images/DINERS.png</Logo><Name>DINERS</Name></PaymentMethod><PaymentMethod><ID>6</ID><Logo>http://10.123.4.121:8092/images/CABAL.png</Logo><Name>CABAL</Name></PaymentMethod><PaymentMethod><ID>13</ID><Logo>http://10.123.4.121:8092/images/MAESTRO.png</Logo><Name>MAESTRO</Name></PaymentMethod><PaymentMethod><ID>14</ID><Logo>http://10.123.4.121:8092/images/MC.png</Logo><Name>MASTERCARD</Name></PaymentMethod><PaymentMethod><ID>30</ID><Logo>http://10.123.4.121:8092/images/NARANJA.png</Logo><Name>NARANJA</Name></PaymentMethod><PaymentMethod><ID>42</ID><Logo>http://10.123.4.121:8092/images/VISA.png</Logo><Name>VISA</Name></PaymentMethod><PaymentMethod><ID>43</ID><Logo>http://10.123.4.121:8092/images/VISAD.png</Logo><Name>VISA DEBITO</Name></PaymentMethod><PaymentMethod><ID>129</ID><Logo>http://10.123.4.121:8092/images/CABALD.png</Logo><Name>CABAL24</Name></PaymentMethod><PaymentMethod><ID>500</ID><Logo>http://10.123.4.121:8092/images/RAPIPAGO.png</Logo><Name>RAPIPAGO</Name></PaymentMethod><PaymentMethod><ID>900</ID><Logo>http://10.123.4.121:8092/images/VISAR.jpg</Logo><Name>VISA RECARGABLE</Name></PaymentMethod><PaymentMethod><ID>907</ID><Logo>http://10.123.4.121:8092/images/MCD.png</Logo><Name>MASTER DEBIT</Name></PaymentMethod></PaymentMethodsCollection>' 
    end 

	def discoverPaymentMethodsResponseFail
        return '<PaymentMethodsCollection xmlns="http://api.todopago.com.ar"></PaymentMethodsCollection>'	
	end

    ### GET AllPaymentMethods
    def GetAllPaymentMethodsResponseOK
    	return '<Result xmlns="http://api.todopago.com.ar"><PaymentMethodsCollection><PaymentMethod><Id>1</Id><Name>AMEX</Name><Logo>http://10.123.4.121:8092/images/AMEX.png</Logo><ExpirationDateCheck>true</ExpirationDateCheck><SecurityCodeLength>4</SecurityCodeLength><SecurityCodeCheck>true</SecurityCodeCheck><CardNumberLengthMax>15</CardNumberLengthMax><CardNumberLengthMin>15</CardNumberLengthMin><CurrenciesCollection><Currency><Id>032</Id><Name>Peso Argentino</Name></Currency></CurrenciesCollection></PaymentMethod><PaymentMethod><Id>2</Id><Name>DINERS</Name><Logo>http://10.123.4.121:8092/images/DINERS.png</Logo><ExpirationDateCheck>true</ExpirationDateCheck><SecurityCodeLength>3</SecurityCodeLength><SecurityCodeCheck>true</SecurityCodeCheck><CardNumberLengthMax>16</CardNumberLengthMax><CardNumberLengthMin>14</CardNumberLengthMin><CurrenciesCollection></CurrenciesCollection></PaymentMethod><PaymentMethod><Id>6</Id><Name>CABAL</Name><Logo>http://10.123.4.121:8092/images/CABAL.png</Logo><ExpirationDateCheck>true</ExpirationDateCheck><SecurityCodeLength>3</SecurityCodeLength><SecurityCodeCheck>true</SecurityCodeCheck><CardNumberLengthMax>16</CardNumberLengthMax><CardNumberLengthMin>16</CardNumberLengthMin><CurrenciesCollection><Currency><Id>032</Id><Name>Peso Argentino</Name></Currency></CurrenciesCollection></PaymentMethod><PaymentMethod><Id>13</Id><Name>MAESTRO</Name><Logo>http://10.123.4.121:8092/images/MAESTRO.png</Logo><ExpirationDateCheck>false</ExpirationDateCheck><SecurityCodeLength>3</SecurityCodeLength><SecurityCodeCheck>true</SecurityCodeCheck><CardNumberLengthMax>18</CardNumberLengthMax><CardNumberLengthMin>16</CardNumberLengthMin><CurrenciesCollection></CurrenciesCollection></PaymentMethod><PaymentMethod><Id>14</Id><Name>MASTERCARD</Name><Logo>http://10.123.4.121:8092/images/MC.png</Logo><ExpirationDateCheck>true</ExpirationDateCheck><SecurityCodeLength>3</SecurityCodeLength><SecurityCodeCheck>true</SecurityCodeCheck><CardNumberLengthMax>16</CardNumberLengthMax><CardNumberLengthMin>16</CardNumberLengthMin><CurrenciesCollection><Currency><Id>032</Id><Name>Peso Argentino</Name></Currency></CurrenciesCollection></PaymentMethod><PaymentMethod><Id>30</Id><Name>NARANJA</Name><Logo>http://10.123.4.121:8092/images/NARANJA.png</Logo><ExpirationDateCheck>true</ExpirationDateCheck><SecurityCodeLength>3</SecurityCodeLength><SecurityCodeCheck>true</SecurityCodeCheck><CardNumberLengthMax>16</CardNumberLengthMax><CardNumberLengthMin>16</CardNumberLengthMin><CurrenciesCollection><Currency><Id>032</Id><Name>Peso Argentino</Name></Currency><Currency><Id>032</Id><Name>Peso Argentino</Name></Currency></CurrenciesCollection></PaymentMethod><PaymentMethod><Id>42</Id><Name>VISA</Name><Logo>http://10.123.4.121:8092/images/VISA.png</Logo><ExpirationDateCheck>true</ExpirationDateCheck><SecurityCodeLength>3</SecurityCodeLength><SecurityCodeCheck>true</SecurityCodeCheck><CardNumberLengthMax>16</CardNumberLengthMax><CardNumberLengthMin>16</CardNumberLengthMin><CurrenciesCollection><Currency><Id>032</Id><Name>Peso Argentino</Name></Currency><Currency><Id>841</Id><Name>Dolar Estadounidense</Name></Currency></CurrenciesCollection></PaymentMethod><PaymentMethod><Id>43</Id><Name>VISA DEBITO</Name><Logo>http://10.123.4.121:8092/images/VISAD.png</Logo><ExpirationDateCheck>false</ExpirationDateCheck><SecurityCodeLength>0</SecurityCodeLength><SecurityCodeCheck>false</SecurityCodeCheck><CardNumberLengthMax>19</CardNumberLengthMax><CardNumberLengthMin>13</CardNumberLengthMin><CurrenciesCollection><Currency><Id>032</Id><Name>Peso Argentino</Name></Currency></CurrenciesCollection></PaymentMethod><PaymentMethod><Id>129</Id><Name>CABAL24</Name><Logo>http://10.123.4.121:8092/images/CABALD.png</Logo><ExpirationDateCheck>false</ExpirationDateCheck><SecurityCodeLength>3</SecurityCodeLength><SecurityCodeCheck>true</SecurityCodeCheck><CardNumberLengthMax>19</CardNumberLengthMax><CardNumberLengthMin>13</CardNumberLengthMin><CurrenciesCollection></CurrenciesCollection></PaymentMethod><PaymentMethod><Id>500</Id><Name>RAPIPAGO</Name><Logo>http://10.123.4.121:8092/images/RAPIPAGO.png</Logo><ExpirationDateCheck>false</ExpirationDateCheck><SecurityCodeLength>0</SecurityCodeLength><SecurityCodeCheck>false</SecurityCodeCheck><CardNumberLengthMax>0</CardNumberLengthMax><CardNumberLengthMin>0</CardNumberLengthMin><CurrenciesCollection><Currency><Id>032</Id><Name>Peso Argentino</Name></Currency></CurrenciesCollection></PaymentMethod><PaymentMethod><Id>900</Id><Name>VISA RECARGABLE</Name><Logo>http://10.123.4.121:8092/images/VISAR.jpg</Logo><ExpirationDateCheck>true</ExpirationDateCheck><SecurityCodeLength>0</SecurityCodeLength><SecurityCodeCheck>true</SecurityCodeCheck><CardNumberLengthMax>18</CardNumberLengthMax><CardNumberLengthMin>13</CardNumberLengthMin><CurrenciesCollection></CurrenciesCollection></PaymentMethod><PaymentMethod><Id>907</Id><Name>MASTER DEBIT</Name><Logo>http://10.123.4.121:8092/images/MCD.png</Logo><ExpirationDateCheck>false</ExpirationDateCheck><SecurityCodeLength>3</SecurityCodeLength><SecurityCodeCheck>true</SecurityCodeCheck><CardNumberLengthMax>16</CardNumberLengthMax><CardNumberLengthMin>16</CardNumberLengthMin><CurrenciesCollection></CurrenciesCollection></PaymentMethod></PaymentMethodsCollection><BanksCollection><Bank><Id>1</Id><Code>034</Code><Name>BANCO PATAGONIA S.A.</Name><Logo xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xsi:nil="true"></Logo></Bank><Bank><Id>2</Id><Code>285</Code><Name>BANCO MACRO S.A.</Name><Logo xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xsi:nil="true"></Logo></Bank><Bank><Id>3</Id><Code>014</Code><Name>BANCO DE LA PROVINCIA DE BS.AS.</Name><Logo xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xsi:nil="true"></Logo></Bank><Bank><Id>4</Id><Code>015</Code><Name>ICBC</Name><Logo xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xsi:nil="true"></Logo></Bank><Bank><Id>5</Id><Code>150</Code><Name>HSBC BANK ARGENTINA S.A.</Name><Logo xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xsi:nil="true"></Logo></Bank><Bank><Id>6</Id><Code>016</Code><Name>CITIBANK</Name><Logo xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xsi:nil="true"></Logo></Bank><Bank><Id>7</Id><Code>017</Code><Name>BBVA BANCO FRANCES S.A.</Name><Logo xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xsi:nil="true"></Logo></Bank><Bank><Id>8</Id><Code>191</Code><Name>BANCO CREDICOOP</Name><Logo xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xsi:nil="true"></Logo></Bank><Bank><Id>9</Id><Code>259</Code><Name>BANCO ITAU ARGENTINA S.A.</Name><Logo xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xsi:nil="true"></Logo></Bank><Bank><Id>10</Id><Code>027</Code><Name>BANCO SUPERVIELLE S.A.</Name><Logo xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xsi:nil="true"></Logo></Bank><Bank><Id>11</Id><Code>029</Code><Name>BANCO CIUDAD DE BUENOS AIRES</Name><Logo xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xsi:nil="true"></Logo></Bank><Bank><Id>12</Id><Code>299</Code><Name>BANCO COMAFI</Name><Logo xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xsi:nil="true"></Logo></Bank><Bank><Id>13</Id><Code>330</Code><Name>NUEVO BANCO DE SANTA FE</Name><Logo xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xsi:nil="true"></Logo></Bank><Bank><Id>14</Id><Code>044</Code><Name>BANCO HIPOTECARIO</Name><Logo xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xsi:nil="true"></Logo></Bank><Bank><Id>15</Id><Code>011</Code><Name>BANCO DE LA NACION ARGENTINA</Name><Logo xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xsi:nil="true"></Logo></Bank><Bank><Id>16</Id><Code>060</Code><Name>BANCO DEL TUCUMAN S.A.</Name><Logo xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xsi:nil="true"></Logo></Bank><Bank><Id>17</Id><Code>007</Code><Name>BANCO GALICIA</Name><Logo xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xsi:nil="true"></Logo></Bank><Bank><Id>18</Id><Code>072</Code><Name>BANCO SANTANDER RIO S A</Name><Logo xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xsi:nil="true"></Logo></Bank><Bank><Id>19</Id><Code>999</Code><Name>OTROS</Name><Logo xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xsi:nil="true"></Logo></Bank><Bank><Id>20</Id><Code>045</Code><Name>BANCO DE SAN JUAN</Name><Logo xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xsi:nil="true"></Logo></Bank><Bank><Id>21</Id><Code>086</Code><Name>BANCO SANTA CRUZ</Name><Logo xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xsi:nil="true"></Logo></Bank><Bank><Id>22</Id><Code>322</Code><Name>BIND</Name><Logo xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xsi:nil="true"></Logo></Bank><Bank><Id>23</Id><Code>386</Code><Name>NUEVO BANCO DE ENTRE RIOS</Name><Logo xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xsi:nil="true"></Logo></Bank><Bank><Id>24</Id><Code>389</Code><Name>COLUMBIA</Name><Logo xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xsi:nil="true"></Logo></Bank><Bank><Id>25</Id><Code>450</Code><Name>NARANJA VISA</Name><Logo xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xsi:nil="true"></Logo></Bank><Bank><Id>26</Id><Code>455</Code><Name>NEVADA</Name><Logo xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xsi:nil="true"></Logo></Bank><Bank><Id>27</Id><Code>499</Code><Name>MIRA</Name><Logo xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xsi:nil="true"></Logo></Bank><Bank><Id>28</Id><Code>515</Code><Name>TARSHOP</Name><Logo xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xsi:nil="true"></Logo></Bank><Bank><Id>29</Id><Code>077</Code><Name>EFECTIVO SI</Name><Logo xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xsi:nil="true"></Logo></Bank><Bank><Id>30</Id><Code>800</Code><Name>AMEX</Name><Logo xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xsi:nil="true"></Logo></Bank><Bank><Id>31</Id><Code>801</Code><Name>NARANJA</Name><Logo xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xsi:nil="true"></Logo></Bank><Bank><Id>32</Id><Code>148</Code><Name>BANCO MUNICIPAL DE LA PLATA</Name><Logo xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xsi:nil="true"></Logo></Bank><Bank><Id>33</Id><Code>020</Code><Name>BANCO DE CORDOBA</Name><Logo xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xsi:nil="true"></Logo></Bank><Bank><Id>34</Id><Code>065</Code><Name>BANCO MUNICIPAL DE ROSARIO</Name><Logo xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xsi:nil="true"></Logo></Bank><Bank><Id>35</Id><Code>066</Code><Name>BANCO MUNICIPAL DE ROSARIO/CONSUMAX</Name><Logo xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xsi:nil="true"></Logo></Bank><Bank><Id>36</Id><Code>083</Code><Name>BANCO DEL CHUBUT</Name><Logo xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xsi:nil="true"></Logo></Bank><Bank><Id>37</Id><Code>093</Code><Name>BANCO DE LA PAMPA</Name><Logo xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xsi:nil="true"></Logo></Bank><Bank><Id>38</Id><Code>094</Code><Name>BANCO DE CORRIENTES</Name><Logo xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xsi:nil="true"></Logo></Bank><Bank><Id>39</Id><Code>097</Code><Name>BANCO PROVINCIA DE NEUQUEN</Name><Logo xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xsi:nil="true"></Logo></Bank><Bank><Id>40</Id><Code>121</Code><Name>PROVENCRED</Name><Logo xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xsi:nil="true"></Logo></Bank><Bank><Id>41</Id><Code>268</Code><Name>BANCO DE TIERRA DEL FUEGO</Name><Logo xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xsi:nil="true"></Logo></Bank><Bank><Id>42</Id><Code>277</Code><Name>BANCO SAENZ</Name><Logo xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xsi:nil="true"></Logo></Bank><Bank><Id>43</Id><Code>301</Code><Name>BANCO PIANO</Name><Logo xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xsi:nil="true"></Logo></Bank><Bank><Id>44</Id><Code>303</Code><Name>BANCO FINANSUR</Name><Logo xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xsi:nil="true"></Logo></Bank><Bank><Id>45</Id><Code>309</Code><Name>NUEVO BANCO DE LA RIOJA</Name><Logo xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xsi:nil="true"></Logo></Bank><Bank><Id>46</Id><Code>311</Code><Name>NUEVO BANCO DEL CHACO</Name><Logo xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xsi:nil="true"></Logo></Bank><Bank><Id>47</Id><Code>315</Code><Name>BANCO DE FORMOSA S.A</Name><Logo xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xsi:nil="true"></Logo></Bank><Bank><Id>48</Id><Code>321</Code><Name>BANCO DE SANTIAGO DEL ESTERO</Name><Logo xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xsi:nil="true"></Logo></Bank><Bank><Id>49</Id><Code>331</Code><Name>BANCO CETELEM</Name><Logo xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xsi:nil="true"></Logo></Bank><Bank><Id>50</Id><Code>341</Code><Name>BANCO MAS VENTAS S A</Name><Logo xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xsi:nil="true"></Logo></Bank><Bank><Id>51</Id><Code>416</Code><Name>NATIVA NACION</Name><Logo xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xsi:nil="true"></Logo></Bank><Bank><Id>52</Id><Code>426</Code><Name>BANCO BICA</Name><Logo xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xsi:nil="true"></Logo></Bank><Bank><Id>53</Id><Code>431</Code><Name>BANCO COINAG</Name><Logo xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xsi:nil="true"></Logo></Bank><Bank><Id>54</Id><Code>468</Code><Name>BANCO FUEGUINA</Name><Logo xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xsi:nil="true"></Logo></Bank><Bank><Id>55</Id><Code>488</Code><Name>BANCO CAJA POPULAR DE TUCUMAN</Name><Logo xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xsi:nil="true"></Logo></Bank><Bank><Id>56</Id><Code>310</Code><Name>BANCO DEL SOL</Name><Logo xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xsi:nil="true"></Logo></Bank><Bank><Id>57</Id><Code>338</Code><Name>BST</Name><Logo xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xsi:nil="true"></Logo></Bank><Bank><Id>58</Id><Code>269</Code><Name>BANCO DE LA REP. ORIENTAL DEL URUGUAY</Name><Logo xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xsi:nil="true"></Logo></Bank></BanksCollection><PaymentMethodBanksCollection><PaymentMethodBank><PaymentMethodId>42</PaymentMethodId><BankId>1</BankId></PaymentMethodBank><PaymentMethodBank><PaymentMethodId>42</PaymentMethodId><BankId>2</BankId></PaymentMethodBank><PaymentMethodBank><PaymentMethodId>42</PaymentMethodId><BankId>3</BankId></PaymentMethodBank><PaymentMethodBank><PaymentMethodId>42</PaymentMethodId><BankId>4</BankId></PaymentMethodBank><PaymentMethodBank><PaymentMethodId>42</PaymentMethodId><BankId>5</BankId></PaymentMethodBank><PaymentMethodBank><PaymentMethodId>42</PaymentMethodId><BankId>6</BankId></PaymentMethodBank><PaymentMethodBank><PaymentMethodId>42</PaymentMethodId><BankId>7</BankId></PaymentMethodBank><PaymentMethodBank><PaymentMethodId>42</PaymentMethodId><BankId>8</BankId></PaymentMethodBank><PaymentMethodBank><PaymentMethodId>42</PaymentMethodId><BankId>9</BankId></PaymentMethodBank><PaymentMethodBank><PaymentMethodId>42</PaymentMethodId><BankId>10</BankId></PaymentMethodBank><PaymentMethodBank><PaymentMethodId>42</PaymentMethodId><BankId>11</BankId></PaymentMethodBank><PaymentMethodBank><PaymentMethodId>42</PaymentMethodId><BankId>12</BankId></PaymentMethodBank><PaymentMethodBank><PaymentMethodId>42</PaymentMethodId><BankId>13</BankId></PaymentMethodBank><PaymentMethodBank><PaymentMethodId>42</PaymentMethodId><BankId>14</BankId></PaymentMethodBank><PaymentMethodBank><PaymentMethodId>42</PaymentMethodId><BankId>15</BankId></PaymentMethodBank><PaymentMethodBank><PaymentMethodId>42</PaymentMethodId><BankId>16</BankId></PaymentMethodBank><PaymentMethodBank><PaymentMethodId>42</PaymentMethodId><BankId>17</BankId></PaymentMethodBank><PaymentMethodBank><PaymentMethodId>42</PaymentMethodId><BankId>18</BankId></PaymentMethodBank><PaymentMethodBank><PaymentMethodId>42</PaymentMethodId><BankId>19</BankId></PaymentMethodBank><PaymentMethodBank><PaymentMethodId>30</PaymentMethodId><BankId>19</BankId></PaymentMethodBank><PaymentMethodBank><PaymentMethodId>2</PaymentMethodId><BankId>12</BankId></PaymentMethodBank><PaymentMethodBank><PaymentMethodId>2</PaymentMethodId><BankId>19</BankId></PaymentMethodBank><PaymentMethodBank><PaymentMethodId>14</PaymentMethodId><BankId>1</BankId></PaymentMethodBank><PaymentMethodBank><PaymentMethodId>14</PaymentMethodId><BankId>2</BankId></PaymentMethodBank><PaymentMethodBank><PaymentMethodId>14</PaymentMethodId><BankId>3</BankId></PaymentMethodBank><PaymentMethodBank><PaymentMethodId>14</PaymentMethodId><BankId>4</BankId></PaymentMethodBank><PaymentMethodBank><PaymentMethodId>14</PaymentMethodId><BankId>5</BankId></PaymentMethodBank><PaymentMethodBank><PaymentMethodId>14</PaymentMethodId><BankId>6</BankId></PaymentMethodBank><PaymentMethodBank><PaymentMethodId>14</PaymentMethodId><BankId>7</BankId></PaymentMethodBank><PaymentMethodBank><PaymentMethodId>14</PaymentMethodId><BankId>8</BankId></PaymentMethodBank><PaymentMethodBank><PaymentMethodId>14</PaymentMethodId><BankId>9</BankId></PaymentMethodBank><PaymentMethodBank><PaymentMethodId>14</PaymentMethodId><BankId>10</BankId></PaymentMethodBank><PaymentMethodBank><PaymentMethodId>14</PaymentMethodId><BankId>11</BankId></PaymentMethodBank><PaymentMethodBank><PaymentMethodId>14</PaymentMethodId><BankId>12</BankId></PaymentMethodBank><PaymentMethodBank><PaymentMethodId>14</PaymentMethodId><BankId>13</BankId></PaymentMethodBank><PaymentMethodBank><PaymentMethodId>14</PaymentMethodId><BankId>15</BankId></PaymentMethodBank><PaymentMethodBank><PaymentMethodId>14</PaymentMethodId><BankId>16</BankId></PaymentMethodBank><PaymentMethodBank><PaymentMethodId>14</PaymentMethodId><BankId>17</BankId></PaymentMethodBank><PaymentMethodBank><PaymentMethodId>14</PaymentMethodId><BankId>19</BankId></PaymentMethodBank><PaymentMethodBank><PaymentMethodId>6</PaymentMethodId><BankId>8</BankId></PaymentMethodBank><PaymentMethodBank><PaymentMethodId>1</PaymentMethodId><BankId>2</BankId></PaymentMethodBank><PaymentMethodBank><PaymentMethodId>1</PaymentMethodId><BankId>5</BankId></PaymentMethodBank><PaymentMethodBank><PaymentMethodId>1</PaymentMethodId><BankId>16</BankId></PaymentMethodBank><PaymentMethodBank><PaymentMethodId>1</PaymentMethodId><BankId>18</BankId></PaymentMethodBank><PaymentMethodBank><PaymentMethodId>1</PaymentMethodId><BankId>19</BankId></PaymentMethodBank><PaymentMethodBank><PaymentMethodId>43</PaymentMethodId><BankId>7</BankId></PaymentMethodBank><PaymentMethodBank><PaymentMethodId>43</PaymentMethodId><BankId>4</BankId></PaymentMethodBank><PaymentMethodBank><PaymentMethodId>43</PaymentMethodId><BankId>5</BankId></PaymentMethodBank><PaymentMethodBank><PaymentMethodId>43</PaymentMethodId><BankId>10</BankId></PaymentMethodBank><PaymentMethodBank><PaymentMethodId>43</PaymentMethodId><BankId>17</BankId></PaymentMethodBank><PaymentMethodBank><PaymentMethodId>43</PaymentMethodId><BankId>49</BankId></PaymentMethodBank><PaymentMethodBank><PaymentMethodId>43</PaymentMethodId><BankId>20</BankId></PaymentMethodBank><PaymentMethodBank><PaymentMethodId>43</PaymentMethodId><BankId>16</BankId></PaymentMethodBank><PaymentMethodBank><PaymentMethodId>43</PaymentMethodId><BankId>21</BankId></PaymentMethodBank><PaymentMethodBank><PaymentMethodId>43</PaymentMethodId><BankId>23</BankId></PaymentMethodBank><PaymentMethodBank><PaymentMethodId>43</PaymentMethodId><BankId>13</BankId></PaymentMethodBank><PaymentMethodBank><PaymentMethodId>43</PaymentMethodId><BankId>56</BankId></PaymentMethodBank><PaymentMethodBank><PaymentMethodId>43</PaymentMethodId><BankId>58</BankId></PaymentMethodBank><PaymentMethodBank><PaymentMethodId>129</PaymentMethodId><BankId>8</BankId></PaymentMethodBank><PaymentMethodBank><PaymentMethodId>13</PaymentMethodId><BankId>11</BankId></PaymentMethodBank><PaymentMethodBank><PaymentMethodId>13</PaymentMethodId><BankId>9</BankId></PaymentMethodBank><PaymentMethodBank><PaymentMethodId>13</PaymentMethodId><BankId>15</BankId></PaymentMethodBank><PaymentMethodBank><PaymentMethodId>13</PaymentMethodId><BankId>2</BankId></PaymentMethodBank><PaymentMethodBank><PaymentMethodId>13</PaymentMethodId><BankId>19</BankId></PaymentMethodBank><PaymentMethodBank><PaymentMethodId>906</PaymentMethodId><BankId>19</BankId></PaymentMethodBank><PaymentMethodBank><PaymentMethodId>907</PaymentMethodId><BankId>19</BankId></PaymentMethodBank><PaymentMethodBank><PaymentMethodId>43</PaymentMethodId><BankId>52</BankId></PaymentMethodBank><PaymentMethodBank><PaymentMethodId>43</PaymentMethodId><BankId>11</BankId></PaymentMethodBank><PaymentMethodBank><PaymentMethodId>43</PaymentMethodId><BankId>12</BankId></PaymentMethodBank><PaymentMethodBank><PaymentMethodId>43</PaymentMethodId><BankId>3</BankId></PaymentMethodBank><PaymentMethodBank><PaymentMethodId>43</PaymentMethodId><BankId>14</BankId></PaymentMethodBank><PaymentMethodBank><PaymentMethodId>43</PaymentMethodId><BankId>9</BankId></PaymentMethodBank><PaymentMethodBank><PaymentMethodId>43</PaymentMethodId><BankId>2</BankId></PaymentMethodBank><PaymentMethodBank><PaymentMethodId>43</PaymentMethodId><BankId>1</BankId></PaymentMethodBank><PaymentMethodBank><PaymentMethodId>43</PaymentMethodId><BankId>18</BankId></PaymentMethodBank><PaymentMethodBank><PaymentMethodId>43</PaymentMethodId><BankId>6</BankId></PaymentMethodBank><PaymentMethodBank><PaymentMethodId>43</PaymentMethodId><BankId>24</BankId></PaymentMethodBank><PaymentMethodBank><PaymentMethodId>900</PaymentMethodId><BankId>8</BankId></PaymentMethodBank><PaymentMethodBank><PaymentMethodId>900</PaymentMethodId><BankId>17</BankId></PaymentMethodBank><PaymentMethodBank><PaymentMethodId>43</PaymentMethodId><BankId>19</BankId></PaymentMethodBank><PaymentMethodBank><PaymentMethodId>900</PaymentMethodId><BankId>19</BankId></PaymentMethodBank><PaymentMethodBank><PaymentMethodId>900</PaymentMethodId><BankId>7</BankId></PaymentMethodBank><PaymentMethodBank><PaymentMethodId>42</PaymentMethodId><BankId>42</BankId></PaymentMethodBank><PaymentMethodBank><PaymentMethodId>14</PaymentMethodId><BankId>42</BankId></PaymentMethodBank><PaymentMethodBank><PaymentMethodId>43</PaymentMethodId><BankId>42</BankId></PaymentMethodBank><PaymentMethodBank><PaymentMethodId>42</PaymentMethodId><BankId>24</BankId></PaymentMethodBank></PaymentMethodBanksCollection></Result>'   	
    end

    ### GET BY RANGE DATETIME	
    def GetByRangeDateTimeOptions(test_condition)
    	optionsGBRDT=Hash.new
		optionsGBRDT[:Merchant]= "2153"
		optionsGBRDT[:STARTDATE]= "2017-01-01"
		optionsGBRDT[:ENDDATE]= "2017-02-30"
		optionsGBRDT[:PAGENUMBER] = 1 
		if (test_condition=='fail')
			optionsGBRDT[:Merchant]= "1111"
		end

		return optionsGBRDT
    end	

    def GetByRangeDateTimeResponseOk
    	return '<OperationsColections xmlns="http://api.todopago.com.ar"><Operations><RESULTCODE>-1</RESULTCODE><RESULTMESSAGE>APROBADA</RESULTMESSAGE><DATETIME>2016-09-01T12:09:35.880-03:00</DATETIME><OPERATIONID>185</OPERATIONID><CURRENCYCODE>32</CURRENCYCODE><AMOUNT>3.00</AMOUNT><FEEAMOUNT>0.12</FEEAMOUNT><TAXAMOUNT>0.03</TAXAMOUNT><SERVICECHARGEAMOUNT xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xsi:nil="true"></SERVICECHARGEAMOUNT><CREDITEDAMOUNT>2.85</CREDITEDAMOUNT><AMOUNTBUYER>3.00</AMOUNTBUYER><FEEAMOUNTBUYER xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xsi:nil="true"></FEEAMOUNTBUYER><TAXAMOUNTBUYER xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xsi:nil="true"></TAXAMOUNTBUYER><CREDITEDAMOUNTBUYER>3.00</CREDITEDAMOUNTBUYER><BANKID>18</BANKID><PROMOTIONID>148047</PROMOTIONID><TYPE>compra_online</TYPE><INSTALLMENTPAYMENTS>1</INSTALLMENTPAYMENTS><CUSTOMEREMAIL>elenagaivironsky@hotmail.com</CUSTOMEREMAIL><IDENTIFICATIONTYPE>DNI</IDENTIFICATIONTYPE><IDENTIFICATION>13415824</IDENTIFICATION><CARDNUMBER>45097901XXXXXX5600</CARDNUMBER><CARDHOLDERNAME>Mauricio Ghiorzi</CARDHOLDERNAME><TICKETNUMBER>5190</TICKETNUMBER><AUTHORIZATIONCODE>004675</AUTHORIZATIONCODE><BARCODE xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xsi:nil="true"></BARCODE><COUPONEXPDATE xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xsi:nil="true"></COUPONEXPDATE><COUPONSECEXPDATE xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xsi:nil="true"></COUPONSECEXPDATE><COUPONSUBSCRIBER xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xsi:nil="true"></COUPONSUBSCRIBER><PAYMENTMETHODCODE>42</PAYMENTMETHODCODE><PAYMENTMETHODNAME>VISA</PAYMENTMETHODNAME><PAYMENTMETHODTYPE>Crédito</PAYMENTMETHODTYPE><REFUNDED>2016-09-01T15:29:28.500-03:00</REFUNDED><PUSHNOTIFYMETHOD xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xsi:nil="true"></PUSHNOTIFYMETHOD><PUSHNOTIFYENDPOINT xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xsi:nil="true"></PUSHNOTIFYENDPOINT><PUSHNOTIFYSTATES xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xsi:nil="true"></PUSHNOTIFYSTATES><IDCONTRACARGO>0</IDCONTRACARGO><FECHANOTIFICACIONCUENTA xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xsi:nil="true"></FECHANOTIFICACIONCUENTA><ESTADOCONTRACARGO xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xsi:nil="true"></ESTADOCONTRACARGO><COMISION>0.12</COMISION><REFUNDS><REFUND><ID>3788872</ID><AMOUNT>3.00</AMOUNT><DATETIME>2016-09-01T15:29:28.800-03:00</DATETIME></REFUND></REFUNDS></Operations><Operations><RESULTCODE>-1</RESULTCODE><RESULTMESSAGE>APROBADA</RESULTMESSAGE><DATETIME>2016-09-01T12:09:35.880-03:00</DATETIME><OPERATIONID>185</OPERATIONID><CURRENCYCODE>32</CURRENCYCODE><AMOUNT>3.00</AMOUNT><FEEAMOUNT>0.12</FEEAMOUNT><TAXAMOUNT>0.03</TAXAMOUNT><SERVICECHARGEAMOUNT xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xsi:nil="true"></SERVICECHARGEAMOUNT><CREDITEDAMOUNT>2.85</CREDITEDAMOUNT><AMOUNTBUYER>3.00</AMOUNTBUYER><FEEAMOUNTBUYER xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xsi:nil="true"></FEEAMOUNTBUYER><TAXAMOUNTBUYER xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xsi:nil="true"></TAXAMOUNTBUYER><CREDITEDAMOUNTBUYER>3.00</CREDITEDAMOUNTBUYER><BANKID>18</BANKID><PROMOTIONID>148047</PROMOTIONID><TYPE>compra_online</TYPE><INSTALLMENTPAYMENTS>1</INSTALLMENTPAYMENTS><CUSTOMEREMAIL>elenagaivironsky@hotmail.com</CUSTOMEREMAIL><IDENTIFICATIONTYPE>DNI</IDENTIFICATIONTYPE><IDENTIFICATION>13415824</IDENTIFICATION><CARDNUMBER>45097901XXXXXX5600</CARDNUMBER><CARDHOLDERNAME>Mauricio Ghiorzi</CARDHOLDERNAME><TICKETNUMBER>5190</TICKETNUMBER><AUTHORIZATIONCODE>004675</AUTHORIZATIONCODE><BARCODE xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xsi:nil="true"></BARCODE><COUPONEXPDATE xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xsi:nil="true"></COUPONEXPDATE><COUPONSECEXPDATE xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xsi:nil="true"></COUPONSECEXPDATE><COUPONSUBSCRIBER xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xsi:nil="true"></COUPONSUBSCRIBER><PAYMENTMETHODCODE>42</PAYMENTMETHODCODE><PAYMENTMETHODNAME>VISA</PAYMENTMETHODNAME><PAYMENTMETHODTYPE>Crédito</PAYMENTMETHODTYPE><REFUNDED>2016-09-01T15:29:28.500-03:00</REFUNDED><PUSHNOTIFYMETHOD xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xsi:nil="true"></PUSHNOTIFYMETHOD><PUSHNOTIFYENDPOINT xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xsi:nil="true"></PUSHNOTIFYENDPOINT><PUSHNOTIFYSTATES xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xsi:nil="true"></PUSHNOTIFYSTATES><IDCONTRACARGO>0</IDCONTRACARGO><FECHANOTIFICACIONCUENTA xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xsi:nil="true"></FECHANOTIFICACIONCUENTA><ESTADOCONTRACARGO xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xsi:nil="true"></ESTADOCONTRACARGO><COMISION>0.12</COMISION><REFUNDS><REFUND><ID>3788872</ID><AMOUNT>3.00</AMOUNT><DATETIME>2016-09-01T15:29:28.800-03:00</DATETIME></REFUND></REFUNDS></Operations><Operations><RESULTCODE>-1</RESULTCODE><RESULTMESSAGE>APROBADA</RESULTMESSAGE><DATETIME>2016-09-01T12:09:35.880-03:00</DATETIME><OPERATIONID>185</OPERATIONID><CURRENCYCODE>32</CURRENCYCODE><AMOUNT>3.00</AMOUNT><FEEAMOUNT>0.12</FEEAMOUNT><TAXAMOUNT>0.03</TAXAMOUNT><SERVICECHARGEAMOUNT xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xsi:nil="true"></SERVICECHARGEAMOUNT><CREDITEDAMOUNT>2.85</CREDITEDAMOUNT><AMOUNTBUYER>3.00</AMOUNTBUYER><FEEAMOUNTBUYER xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xsi:nil="true"></FEEAMOUNTBUYER><TAXAMOUNTBUYER xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xsi:nil="true"></TAXAMOUNTBUYER><CREDITEDAMOUNTBUYER>3.00</CREDITEDAMOUNTBUYER><BANKID>18</BANKID><PROMOTIONID>148047</PROMOTIONID><TYPE>compra_online</TYPE><INSTALLMENTPAYMENTS>1</INSTALLMENTPAYMENTS><CUSTOMEREMAIL>elenagaivironsky@hotmail.com</CUSTOMEREMAIL><IDENTIFICATIONTYPE>DNI</IDENTIFICATIONTYPE><IDENTIFICATION>13415824</IDENTIFICATION><CARDNUMBER>45097901XXXXXX5600</CARDNUMBER><CARDHOLDERNAME>Mauricio Ghiorzi</CARDHOLDERNAME><TICKETNUMBER>5190</TICKETNUMBER><AUTHORIZATIONCODE>004675</AUTHORIZATIONCODE><BARCODE xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xsi:nil="true"></BARCODE><COUPONEXPDATE xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xsi:nil="true"></COUPONEXPDATE><COUPONSECEXPDATE xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xsi:nil="true"></COUPONSECEXPDATE><COUPONSUBSCRIBER xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xsi:nil="true"></COUPONSUBSCRIBER><PAYMENTMETHODCODE>42</PAYMENTMETHODCODE><PAYMENTMETHODNAME>VISA</PAYMENTMETHODNAME><PAYMENTMETHODTYPE>Crédito</PAYMENTMETHODTYPE><REFUNDED>2016-09-01T15:29:28.500-03:00</REFUNDED><PUSHNOTIFYMETHOD xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xsi:nil="true"></PUSHNOTIFYMETHOD><PUSHNOTIFYENDPOINT xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xsi:nil="true"></PUSHNOTIFYENDPOINT><PUSHNOTIFYSTATES xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xsi:nil="true"></PUSHNOTIFYSTATES><IDCONTRACARGO>0</IDCONTRACARGO><FECHANOTIFICACIONCUENTA xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xsi:nil="true"></FECHANOTIFICACIONCUENTA><ESTADOCONTRACARGO xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xsi:nil="true"></ESTADOCONTRACARGO><COMISION>0.12</COMISION><REFUNDS><REFUND><ID>3788872</ID><AMOUNT>3.00</AMOUNT><DATETIME>2016-09-01T15:29:28.800-03:00</DATETIME></REFUND></REFUNDS></Operations></OperationsColections>'
    end

    def GetByRangeDateTimeResponseFail
        return '<OperationsColections xmlns="http://api.todopago.com.ar"></OperationsColections>';
    end


end 