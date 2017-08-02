#encoding: utf-8
require_relative "../lib/todo_pago_conector.rb"
require_relative "../lib/Classes/user.rb"

require_relative "../lib/Exceptions/empty_field_user_exception.rb"
require_relative "../lib/Exceptions/empty_field_password_exception.rb"
require_relative "../lib/Exceptions/connection_exception.rb"
require_relative "../lib/Exceptions/response_exception.rb"
require 'xmlsimple'
require 'json'

j_header_http = {
    'Authorization'=>'TODOPAGO ABCDEF1234567890'
}

endpoint = 'https://developers.todopago.com.ar/'


conector = TodoPagoConector.new(j_header_http, "test")



##############################################Authorize################################################
optionsSAR_operacion = Hash.new
optionsSAR_operacion[:MERCHANT] = "3150"
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
optionsSAR_operacion[:TIMEOUT]= "300000"

optionsSAR_comercio = Hash.new
optionsSAR_comercio[:security]="1234567890ABCDEF1234567890ABCDEF"
optionsSAR_comercio[:MERCHANT]= "2153"
optionsSAR_comercio[:EncodingMethod]="XML"
optionsSAR_comercio[:URL_OK]= "http://someurl.com/ok/"
optionsSAR_comercio[:URL_ERROR]= "http://someurl.com/error/"
optionsSAR_comercio[:EMAILCLIENTE]= "mail@someurl.com"
optionsSAR_comercio[:Session]= "ABCDEF-1234-12221-FDE1-00000200"

puts('--------------------RESPONSE --------------------------------------------------------------------------')
response = conector.sendAuthorizeRequest(optionsSAR_comercio,optionsSAR_operacion)
puts('SendAuthorizeRequest:')
puts(response)
puts('------------------------------------------------------------------------------------------------')


#GAA
optionsAnwser=Hash.new
optionsAnwser[:security]= "f3d8b72c94ab4a06be2ef7c95490f7d3"
optionsAnwser[:MERCHANT]= "2153"
optionsAnwser[:RequestKey]= "710268a7-7688-c8bf-68c9-430107e6b9da"
optionsAnwser[:AnswerKey]= "693ca9cc-c940-06a4-8d96-1ab0d66f3ee6"

response = conector.getAuthorizeAnswer(optionsAnwser)
puts('GetAuthorizeAnswer:')
puts(response)

puts(response)
puts('------------------------------------------------------------------------------------------------')



######################################PaymentMethods#########################################
#GAPM
optionsPaymentMethods=Hash.new
optionsPaymentMethods[:MERCHANT]= "2153"

response = conector.getAllPaymentMethods(optionsPaymentMethods)
puts('GetAllPaymentMethods:')
puts(response)

#Pasar del XML a Hash - Rails
#require 'active_support'
#hash = Hash.from_xml(response)
#Pasar del XML a Hash - sin Rails
#require 'xmlsimple'
#hash = XmlSimple.xml_in(response)
puts('------------------------------------------------------------------------------------------------')

#####################################Operations###############################################
#GS
optionsOperations=Hash.new
optionsOperations[:MERCHANT]= ""
optionsOperations[:OPERATIONID]= "02"

response = conector.getOperations(optionsOperations)
puts('GetStatus:')
puts(response)
#Pasar del XML a Hash - Rails
#require 'active_support'
#hash = Hash.from_xml(response)
#Pasar del XML a Hash - sin Rails
#require 'xmlsimple'
#hash = XmlSimple.xml_in(response)
puts('------------------------------------------------------------------------------------------------')


############################################returnRequest##############################################
puts("DEVOLUCION DE 1 PESO")
optionRR=Hash.new
optionRR[:Merchant] = "2866"
optionRR[:Security] = "1540601877EB2059EF50240E46ABD10E"
optionRR[:RequestKey] = "eeda0188-ec60-d72a-dab8-26bfd0fa5f10"
optionRR[:AMOUNT] = "1"

response = conector.returnRequest(optionRR)
puts(response)
puts('------------------------------------------------------------------------------------------------')

############################################voidRequest##############################################
puts("DEVOLUCION TOTAL")
optionRR=Hash.new
optionRR[:Merchant] = "2866"
optionRR[:Security] = "1540601877EB2059EF50240E46ABD10E"
optionRR[:RequestKey] = "eeda0188-ec60-d72a-dab8-26bfd0fa5f10"

response = conector.voidRequest(optionRR)
puts(response)
puts('------------------------------------------------------------------------------------------------')

############################################Operations##############################################
puts("GET BY RANGE")
#GBRDT
optionsGBRDT=Hash.new
optionsGBRDT[:Merchant]= "2658"
optionsGBRDT[:STARTDATE]= "2016-01-01"
optionsGBRDT[:ENDDATE]= "2016-02-19"
optionsGBRDT[:PAGENUMBER] = 1

response = conector.getByRangeDateTime(optionsGBRDT)
puts(response)
puts('------------------------------------------------------------------------------------------------')


######################################GET CREDENTIALS###############################################
puts("GET CREDENTIALS")
#Credentials
u = User.new("email@ejemplo.com", "password1")
begin
	response = conector.getCredentials(u)
	puts response.merchant
    puts response.apiKey
rescue Exception => msg 
	puts(msg)
end
puts('------------------------------------------------------------------------------------------------')

