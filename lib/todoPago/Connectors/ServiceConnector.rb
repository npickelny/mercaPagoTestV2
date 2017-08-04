#encoding: utf-8

$tenant = 't/1.1/'
$soapAppend = 'services/'
$restAppend = 'api/'

class ServiceConnector
	def initialize(j_header_http, *args)
		j_wsdls = nil, endpoint = nil, env = nil
		if args[0].length == 2
			j_wsdls  = args[0][0]
			endpoint = args[0][1]
		end

		# atributos
		@j_header_http = j_header_http
		@j_wsdls       = j_wsdls
		@endPoint 	   = endpoint
	end
end