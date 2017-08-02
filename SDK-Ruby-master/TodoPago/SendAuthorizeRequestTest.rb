#encoding: utf-8
require_relative "../lib/todo_pago_conector.rb"
require_relative "MockClient.rb"
require_relative "DataProvider.rb"

require "test/unit"


class SendAuthorizeRequestTest < Test::Unit::TestCase
	attr_accessor :clientMock , :dataProvider

	def testSendAuthorizeRequestOk
	    
		@dataProvider = DataProvider.new()
		@clientMock = MockClient.new( @dataProvider.getHeader(), "test")
		sdk = TodoPagoConector.new(@dataProvider.getHeader(), "test")

		sdk.setSoapConnector(@clientMock)

		params = @dataProvider.sendAuthorizeRequestOptions('ok')
		response = sdk.sendAuthorizeRequest(params[:optionsSAR_comercio], params[:optionsSAR_operacion])
		response = JSON.parse(response)

		assert_equal(@dataProvider.sendAuthorizeRequestSoapRequestOK(), @clientMock.getLastRequest())
		assert_equal("-1", response["envelope"]["body"]["send_authorize_request_response"]["status_code"])

	end	

	def testSendAuthorizeRequestFail

		@dataProvider = DataProvider.new()
		@clientMock = MockClient.new(@dataProvider.getHeader(), "test")
		sdk = TodoPagoConector.new(@dataProvider.getHeader(), "test")

		sdk.setSoapConnector(@clientMock)

		params = @dataProvider.sendAuthorizeRequestOptions('fail_required')
		
		response = sdk.sendAuthorizeRequest(params[:optionsSAR_comercio], params[:optionsSAR_operacion])
		response = JSON.parse(response)

		assert_not_equal("-1", response["envelope"]["body"]["send_authorize_request_response"]["status_code"])

	end

	def testSendAuthorizeRequest702
	
		@dataProvider = DataProvider.new()
		@clientMock = MockClient.new(@dataProvider.getHeader(), "test")
		sdk = TodoPagoConector.new(@dataProvider.getHeader(), "test")

		sdk.setSoapConnector(@clientMock)

		params = @dataProvider.sendAuthorizeRequestOptions('702')
		response = sdk.sendAuthorizeRequest(params[:optionsSAR_comercio], params[:optionsSAR_operacion])
		response = JSON.parse(response)

		assert_equal("702", response["envelope"]["body"]["send_authorize_request_response"]["status_code"])

	end


end
