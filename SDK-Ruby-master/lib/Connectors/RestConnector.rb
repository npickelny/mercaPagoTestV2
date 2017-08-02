#encoding: utf-8
require 'rest-client'
require 'json'

require_relative "ServiceConnector"

class RestConnector < ServiceConnector

	def initialize(j_header_http, *args)
		super(j_header_http, args)

		# atributos
		@restEndPoint = @endPoint + $tenant + $restAppend
		@credentialsEndPoint = @endPoint + $restAppend
	end

	def discoverPaymentMethods()
	    url = @restEndPoint + 'PaymentMethods/Discover' 
	    resource = RestClient::Resource.new(url, :verify_ssl => false)
	    xml = resource.get(:Authorization => @j_header_http['Authorization'])

	    return xml
  	end

  	def getCredentials(user)
	    url = @credentialsEndPoint + "Credentials"
	    response = RestClient.post url, user.getData.to_json, :content_type => :json
	    response = JSON.parse(response)

	    if response['Credentials']['resultado']['codigoResultado'] != 0
	    	raise ResponseException.new, response
	    end

	    user.merchant = response['Credentials']['merchantId']
	    user.apiKey = response['Credentials']['APIKey']

	    return user
  	end

	def getOperations(optionsOperations)
		url = @restEndPoint + 'Operations/GetByOperationId/MERCHANT/' + optionsOperations[:MERCHANT] + '/OPERATIONID/' + optionsOperations[:OPERATIONID]

		resource = RestClient::Resource.new(url, :verify_ssl => false)
		xml = resource.get( :Authorization => @j_header_http['Authorization'] )

		return xml
	end

	def getAllPaymentMethods(optionsPaymentMethod)
		url = @restEndPoint + 'PaymentMethods/Get/MERCHANT/' + optionsPaymentMethod[:MERCHANT]

		resource = RestClient::Resource.new(url, :verify_ssl => false)
		xml = resource.get( :Authorization => @j_header_http['Authorization'] )

		return xml
	end

	def getByRangeDateTime(optionsGetByRange)
		url = @restEndPoint +"Operations/GetByRangeDateTime/MERCHANT/#{optionsGetByRange[:Merchant]}/STARTDATE/#{optionsGetByRange[:STARTDATE]}/ENDDATE/#{optionsGetByRange[:ENDDATE]}/PAGENUMBER/#{optionsGetByRange[:PAGENUMBER]}"         
		response = RestClient.get url

		return response
	end
end

