
$tenant = 't/1.1/'
$soapAppend = 'services/'
$restAppend = 'api/'

class ServiceConnector
  def initialize(j_header_http,  j_wsdls = nil, end_point = nil)
  @j_header_http = j_header_http
  @j_wsdls       = j_wsdls
  @endPoint 	   = end_point
  end
end
