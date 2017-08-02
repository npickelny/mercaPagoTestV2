#encoding: utf-8
require_relative "../lib/todo_pago_conector.rb"
require_relative "MockClient.rb"
require_relative "DataProvider.rb"

require "test/unit"


class ReturnRequestTest < Test::Unit::TestCase
	attr_accessor :clientMock , :dataProvider

	def testReturnRequestTestOk
		@dataProvider = DataProvider.new()
		@clientMock = MockClient.new( @dataProvider.getHeader(), "test")
		sdk = TodoPagoConector.new(@dataProvider.getHeader(), "test")

		sdk.setSoapConnector(@clientMock)

		params = @dataProvider.GetReturnOptions('ok')
		response = sdk.returnRequest(params)
		response = JSON.parse(response)

		assert_equal(@dataProvider.GetReturnRequestRequestOK(), @clientMock.getLastRequest())
		assert_equal("2011", response["envelope"]["body"]["return_response"]["status_code"])

	end 

	def testReturnRequestTestFail
		@dataProvider = DataProvider.new()
		@clientMock = MockClient.new( @dataProvider.getHeader(), "test")
		sdk = TodoPagoConector.new(@dataProvider.getHeader(), "test")

		sdk.setSoapConnector(@clientMock)

		params = @dataProvider.GetReturnOptions('fail')
		response = sdk.returnRequest(params)
		response = JSON.parse(response)

		assert_not_equal("2011", response["envelope"]["body"]["return_response"]["status_code"])

	end
	

	def testReturnRequestTestFail702
		@dataProvider = DataProvider.new()
		@clientMock = MockClient.new( @dataProvider.getHeader(), "test")
		sdk = TodoPagoConector.new(@dataProvider.getHeader(), "test")

		sdk.setSoapConnector(@clientMock)

		params = @dataProvider.GetReturnOptions('702')
		response = sdk.returnRequest(params)
		response = JSON.parse(response)

		assert_equal("702", response["envelope"]["body"]["return_response"]["status_code"])

	end
	




end 

