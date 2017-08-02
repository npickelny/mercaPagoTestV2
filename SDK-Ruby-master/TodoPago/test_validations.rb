#encoding: utf-8
require "../lib/FraudControlValidation"
require "../lib/todo_pago_conector.rb"
require "../lib/user.rb"
require "../lib/Exceptions/empty_field_user_exception.rb"
require "../lib/Exceptions/empty_field_password_exception.rb"
require "../lib/Exceptions/connection_exception.rb"
require "../lib/Exceptions/response_exception.rb"

j_header_http = {
    'Authorization'=>'TODOPAGO 1540601877EB2059EF50240E46ABD10E', 'Username'=>'>Test'
}

endpoint = 'https://developers.todopago.com.ar/'

puts 'inicio .... '

TpConnector = TodoPagoConector.new(j_header_http, "test")

puts '******* .... '


parameters = Hash.new
parameters["CSBTCITY"]= "Villa General BelgranoAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA!$%&/()?"  # MANDATORIO.
parameters["CSBTCOUNTRY"]= "ARAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA!$%&/()?" # MANDATORIO.
parameters["CSBTEMAIL"]= "some@someurl.com"  # MANDATORIO.
parameters["CSBTFIRSTNAME"]= "JuanAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA!$%&/()?" # MANDATORIO.
parameters["CSBTLASTNAME"]="PerezAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA!$%&/()?" # MANDATORIO.
parameters["CSBTPHONENUMBER"]="5411609-13988" # MANDATORIO.
parameters["CSBTPOSTALCODE"]="" # MANDATORIO.
parameters["CSBTSTATE"]="B" # MANDATORIO
parameters["CSBTSTREET1"] = "Some Street 2153AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA!$%&/()?" # MANDATORIO.
parameters["CSBTSTREET2"]="t" # NO MANDATORIO
parameters["CSBTCUSTOMERID"]=""  # MANDATORIO.
parameters["CSBTIPADDRESS"]="154.0.0.4"  # MANDATORIO.
parameters["CSPTCURRENCY"]="" # MANDATORIO.
parameters["CSPTGRANDTOTALAMOUNT"]="40" # MANDATORIO.
parameters["CSMDD6"]="" # NO MANDATORIO.
parameters["CSMDD7"]="" # NO MANDATORIO.
parameters["CSMDD8"]=""  # NO MANDATORIO.
parameters["CSMDD9"]="" # NO MANDATORIO.
parameters["CSMDD10"]="" # NO MANDATORIO.
parameters["CSMDD11"]="" # NO MANDATORIO.
parameters["CSSTCITY"] = "Villa General BelgranoPerezAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA!$%&/()?"  # MANDATORIO.
parameters["CSSTCOUNTRY"]="ARPerezAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA!$%&/()?" # MANDATORIO.
parameters["CSSTEMAIL"]="some@someurl.com"  # MANDATORIO.
parameters["CSSTFIRSTNAME"]= "JuanPerezAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA!$%&/()?" # MANDATORIO.
parameters["CSSTLASTNAME"] = "PerezPerezAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA!$%&/()?" # MANDATORIO.
parameters["CSSTPHONENUMBER"]="5411609-13988" # MANDATORIO.
parameters["CSSTPOSTALCODE"]="1111" # MANDATORIO.
parameters["CSSTSTATE"]="B" # MANDATORIO
parameters["CSSTSTREET1"]= "Some Street 2153PerezAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA!$%&/()?" # MANDATORIO.
parameters["CSSTSTREET2"]="t" # NO MANDATORIO.

parameters["CSITPRODUCTCODE"]= "electronic_good#aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa#bbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbb#ccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccc" # CONDICIONAL
parameters["CSITPRODUCTDESCRIPTION"]= "Test Prd Description#aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa#bbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbb#ccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccc" # CONDICIONAL.
parameters["CSITPRODUCTNAME"]= "TestPrd#aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa#bbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbb#ccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccc" # CONDICIONAL.
parameters["CSITPRODUCTSKU"]= "SKU1234#aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa#bbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbb#ccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccc" # CONDICIONAL.
parameters["CSITTOTALAMOUNT"]="10.01#10.01#10.01#10.01" # CONDICIONAL.
parameters["CSITQUANTITY"]="1#1#1#1" # CONDICIONAL.
parameters["CSITUNITPRICE"]="10.01#10.01#10.01#10.01" 
parameters["CSMDD12"]="" # NO MADATORIO.
parameters["CSMDD13"]="" # NO MANDATORIO.
parameters["CSMDD14"]="" # NO MANDATORIO.
parameters["CSMDD15"]="" # NO MANDATORIO.
parameters["CSMDD16"]="" # NO MANDATORIO.
parameters["CSMDD44"]="" # NO MANDATORIO.



optionsSAR_comercio = Hash.new
optionsSAR_comercio[:Security]="1234567890ABCDEF1234567890ABCDEF"
optionsSAR_comercio[:MERCHANT]= "2153"
optionsSAR_comercio[:EncodingMethod]="XML"
optionsSAR_comercio[:URL_OK]= "http://someurl.com/ok/"
optionsSAR_comercio[:URL_ERROR]= "http://someurl.com/error/"
optionsSAR_comercio[:EMAILCLIENTE]= "mail@someurl.com"
optionsSAR_comercio[:Session]= "ABCDEF-1234-12221-FDE1-00000200"

puts 'ya cargue las cosas  ... '

#########################
#res = TpConnector.sendAuthorizeRequest(optionsSAR_comercio, parameters)
#
#puts res
#
#exit 
#################################


Fcv = FraudControlValidation.new()
result = Fcv.validate(parameters)

puts 'RESULT : '
puts result
puts 'errores : '

if(!Fcv.campError.empty?)
	Fcv.campError.each do |field , message|
		puts field + ': ' + message
	end
end
exit





