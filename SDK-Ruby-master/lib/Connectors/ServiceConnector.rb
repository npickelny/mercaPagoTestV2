#encoding: utf-8

$tenant = 't/1.1/'
$soapAppend = 'services/'
$restAppend = 'api/'

class ServiceConnector
	def initialize(j_header_http, *args)#j_wsdl=nil, endpoint=nil, env=nil
		if args.length == 2

			j_wsdls  = args[0]
			endpoint = args[1]

		else args.length == 1

			j_wsdls = { 'Operations'=> '../lib/ServiceReferences/Operations.wsdl', 'Authorize'=> '../lib/ServiceReferences/Authorize.wsdl', 
			'EchoService'=> '../lib/ServiceReferences/EchoService.wsdl' }
			if args[0] == "prod"
				endpoint = 'https://apis.todopago.com.ar/'
			else
				endpoint = 'https://developers.todopago.com.ar/'
				#endpoint = 'http://127.0.0.1:8280/'
			end

		end

		# atributos
		@j_header_http = j_header_http
		@j_wsdls       = j_wsdls
		@endPoint 	   = endpoint
	end
end