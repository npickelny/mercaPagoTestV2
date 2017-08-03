#encoding: utf-8
require 'savon'
require 'json'

require_relative "ServiceConnector"

class SoapConnector < ServiceConnector
	
	def initialize(j_header_http, *args)
		super(j_header_http, args)
	end

	def sendAuthorizeRequest(options_commerce, optionsAuthorize)
		result = ""
		begin
			message = {Security: options_commerce[:security],
				Merchant: options_commerce[:MERCHANT],
				EncodingMethod: options_commerce[:EncodingMethod],
				URL_OK: options_commerce[:URL_OK],
				URL_ERROR: options_commerce[:URL_ERROR],
				EMAILCLIENTE: options_commerce[:EMAILCLIENTE],
				Session: options_commerce[:Session],
				Payload: SoapConnector.buildPayload(optionsAuthorize)}

			client = getClientSoap(@j_wsdls['Authorize'], $tenant + 'Authorize')

			response = client.call(:send_authorize_request, message: message)

			resp  = response.hash

			result = resp.to_json
		rescue Exception=>e
			e.message
			result = e.message.to_json
		end

		return result
  	end

	def getAuthorizeAnswer(optionsAnwser)
		message = {Security: optionsAnwser[:security],
			Merchant: optionsAnwser[:MERCHANT],
			RequestKey: optionsAnwser[:RequestKey],
			AnswerKey: optionsAnwser[:AnswerKey]};

		client = getClientSoap(@j_wsdls['Authorize'], $tenant + 'Authorize')
		response= client.call(:get_authorize_answer, message:message)
		resp = response.hash
		return resp.to_json
	end

	def returnRequest(refoundOptions)
		message = {
			Security: refoundOptions[:Security],
			Merchant: refoundOptions[:Merchant],
			RequestKey: refoundOptions[:RequestKey],
			AMOUNT: refoundOptions[:AMOUNT]
		}

		client = getClientSoap(@j_wsdls['Authorize'], $tenant + 'Authorize')
		response= client.call(:return_request, message:message)
		resp = response.hash

		return resp.to_json
	end

	def echoService(serviceName)
		random = Array.new(15){[*"A".."Z", *"0".."9"].sample}.join
		message = { message: random }
		result = false

		begin
			client = getClientSoapEcho(@j_wsdls['EchoService'], serviceName)
			response = client.call(:echo_operation, message:message)
			resp = response.hash
			result = resp.to_json.include? random
		rescue Exception => msg
			
		end

		return result
	end

	def self.buildPayload(optionAuthorize)

    # optionAuthorize[:SDK] = "Ruby"
    # optionAuthorize[:SDKVERSION] = $versionTodoPago
    # optionAuthorize[:LENGUAGEVERSION] = "#{RUBY_VERSION}-p#{RUBY_PATCHLEVEL}"
	
	    @xml = "<Request>"
	    optionAuthorize.each do |item|
			@xml = @xml.concat("<").concat(item[0].to_s).concat(">")

			#crop values
			aux = if item[1].size > 254 then 
				item[1].slice(0, 253)
			else
				item[1]
			end

			@xml = @xml.concat(aux)
			@xml = @xml.concat("</").concat(item[0].to_s).concat(">")
	    end

	    @xml = @xml.concat("</Request>");
	    
	    return @xml;
  	end

  	###########################################################################################
	#Metodo de clase que crea cliente que accede al servicio a través de SOAP utilizando savon
	###########################################################################################
	private
	def getClientSoap(wsdlService, sufijoEndpoint)
    	return Savon.client(
			headers:@j_header_http,
			wsdl: wsdlService,
			endpoint: @endPoint + $soapAppend + sufijoEndpoint,
			log: false,
			log_level: :debug,
			ssl_verify_mode: :none,
			convert_request_keys_to: :none)
	end
end

