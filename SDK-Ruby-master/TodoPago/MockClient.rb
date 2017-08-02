#encoding: utf-8
require 'savon'
require 'rest-client'
require 'json'
require_relative "../lib/Connectors/ServiceConnector.rb"
require 'xmlsimple'

require_relative "DataProvider.rb"

class MockClient < ServiceConnector
	attr_accessor :merchant_authorized, :existing_transaction, :existing_request_key, :apiKey, :payments_ok, :dataProvider, :lastRequest

	def initialize(j_header_http, *args)
		@merchant_authorized  = '2153'
		@apiKey = 'TODOPAGO f3d8b72c94ab4a06be2ef7c95490f7d3'
		@user = 'mail@todopago.com'
		@password = 'Password1'
		@payments_ok = true
		@existing_transaction = '185'
		@existing_request_key = '710268a7-7688-c8bf-68c9-430107e6b9da'
		@dataProvider = DataProvider.new()
	end

	def getLastRequest()
		return @lastRequest
	end

	### soapClient ###
	def sendAuthorizeRequest(options_commerce, optionsAuthorize)

		response = nil

		@lastRequest = {Security: options_commerce[:security],
						Merchant: options_commerce[:MERCHANT],
						EncodingMethod: options_commerce[:EncodingMethod],
						URL_OK: options_commerce[:URL_OK],
						URL_ERROR: options_commerce[:URL_ERROR],
						EMAILCLIENTE: options_commerce[:EMAILCLIENTE],
						Session: options_commerce[:Session],
						Payload: SoapConnector.buildPayload(optionsAuthorize)}


	    if(optionsAuthorize[:MERCHANT] == @merchant_authorized )
	    	if optionsAuthorize[:CSBTEMAIL] ==""
	    		response = @dataProvider.sendAuthorizeRequestSoapFailRequired()
	    	else
	    		response = @dataProvider.sendAuthorizeRequestSoapResponseOK()
	    	end 
	    elsif optionsAuthorize[:MERCHANT] != @merchant_authorized	
	    	response = @dataProvider.sendAuthorizeRequestSoapFail702()
	    end

		return response
	end 


	def getAuthorizeAnswer(optionsAnwser)
		@lastRequest = {Security: optionsAnwser[:security],
						Merchant: optionsAnwser[:MERCHANT],
						RequestKey: optionsAnwser[:RequestKey],
						AnswerKey: optionsAnwser[:AnswerKey]};

		if(optionsAnwser[:MERCHANT] == @merchant_authorized )
			optionsAnwser.each do |key, value|
				if value.empty?
					return @dataProvider.GetAuthorizeAnswerResponseFail()
				end
			end	
		else
			return @dataProvider.GetAuthorizeAnswerResponse702()
		end				

					

		return @dataProvider.GetAuthorizeAnswerResponseOK()
	end


	def returnRequest(refoundOptions)

		@lastRequest = {
			Security: refoundOptions[:Security],
			Merchant: refoundOptions[:Merchant],
			RequestKey: refoundOptions[:RequestKey],
			AMOUNT: refoundOptions[:AMOUNT]
		}

		if refoundOptions[:Merchant] == @merchant_authorized 
			if refoundOptions[:RequestKey] == @existing_request_key
				response = @dataProvider.GetReturnRequestResponseOK()
			else
				response = @dataProvider.GetReturnRequestResponseFail()
			end
		else
			response = @dataProvider.GetReturnRequestResponseFail702()
		end 

		return response
	end 
	####################


	### restClient
	def getOperations(optionsOperations)
		@lastRequest = 'https://developers.todopago.com.ar/t/1.1/api/Operations/GetByOperationId/MERCHANT/' + optionsOperations[:MERCHANT] + '/OPERATIONID/' + optionsOperations[:OPERATIONID]

		if (optionsOperations[:MERCHANT] == @merchant_authorized and optionsOperations[:OPERATIONID] == @existing_transaction )
			xml =  @dataProvider.GetOperationsResponseOK()
		else 
			xml =  @dataProvider.GetOperationsResponseFail()
		end

		return xml
	end


	def getByRangeDateTime(optionsGetByRange)
		@lastRequest = "https://developers.todopago.com.ar/t/1.1/api/Operations/GetByRangeDateTime/MERCHANT/#{optionsGetByRange[:Merchant]}/STARTDATE/#{optionsGetByRange[:STARTDATE]}/ENDDATE/#{optionsGetByRange[:ENDDATE]}/PAGENUMBER/#{optionsGetByRange[:PAGENUMBER]}"

		if (optionsGetByRange[:Merchant] == @merchant_authorized )
			response =  @dataProvider.GetByRangeDateTimeResponseOk()
		else 
			response =  @dataProvider.GetByRangeDateTimeResponseFail()
		end

		return response
	end


	
	def getCredentials(user)

		@lastRequest = "https://developers.todopago.com.ar/api/Credentials"

	    # aca mando el JSON RestClient.post url, user.getData.to_json, :content_type => :json
	    if ( user.user !=  @user )
	    	response = @dataProvider.GetCredentialsResponseFailUser()
	    	response = JSON.parse(response)

	    	return response
	    end	

	    if ( user.password != @password )
	    	response = @dataProvider.GetCredentialsResponseFailPassword()
	    	response = JSON.parse(response)

	    	return response
	    end

	    response = @dataProvider.GetCredentialsResponseOK()
	    response = JSON.parse(response)

	    user.merchant = response['Credentials']['merchantId']
	    user.apiKey = response['Credentials']['APIKey']

	    return user
	end


	def discoverPaymentMethods
		@lastRequest = 'https://developers.todopago.com.ar/api/PaymentMethods/Discover' 

		if (@payments_ok)
	    	response = @dataProvider.discoverPaymentMethodsResponseOK()
		else
			response = @dataProvider.discoverPaymentMethodsResponseFail()
		end

	    return response
	end 



	def getAllPaymentMethods(optionsPaymentMethod)
		@lastRequest  =  'https://developers.todopago.com.ar/api/PaymentMethods/Get/MERCHANT/' + optionsPaymentMethod[:MERCHANT]

		if (optionsPaymentMethod[:MERCHANT] == @merchant_authorized )
	    	response = @dataProvider.GetAllPaymentMethodsResponseOK()
		else
			response = @dataProvider.discoverPaymentMethodsResponseFail()
		end

	    return response
	end







	def xml_to_hash(xml)
		return XmlSimple.xml_in(xml)
	end
end