#encoding: utf-8
require_relative "../lib/todo_pago_conector.rb"
require_relative "../lib/Classes/user.rb"
require_relative "MockClient.rb"
require_relative "DataProvider.rb"

require "test/unit"


class DiscoverPaymentMethodsTest < Test::Unit::TestCase
	attr_accessor :clientMock , :dataProvider

	def testdiscoverPaymentMethodsOk
		@dataProvider = DataProvider.new()		
		@clientMock = MockClient.new({}, "test")
		sdk = TodoPagoConector.new({}, "test")

		sdk.setRestConnector(@clientMock)
		response = sdk.discoverPaymentMethods()

		assert_equal(@dataProvider.discoverPaymentMethodsResponseOK, response)

	end

	
	def testdiscoverPaymentMethodsFail
		@dataProvider = DataProvider.new()		
		@clientMock = MockClient.new({}, "test")
		@clientMock.payments_ok = false
		sdk = TodoPagoConector.new({}, "test")
		
		sdk.setRestConnector(@clientMock)
		
		response = sdk.discoverPaymentMethods()
		assert_not_equal(@dataProvider.discoverPaymentMethodsResponseOK, response)
	end

	def testGetAllPaymentMethodsOk
		@dataProvider = DataProvider.new()		
		@clientMock = MockClient.new({}, "test")
		sdk = TodoPagoConector.new({}, "test")
		
		sdk.setRestConnector(@clientMock)
		optionsPaymentMethods=Hash.new
		optionsPaymentMethods[:MERCHANT]= "2153"

		response = sdk.getAllPaymentMethods(optionsPaymentMethods)

		
		assert_equal(@dataProvider.GetAllPaymentMethodsResponseOK, response)
	end

	def testGetAllPaymentMethodsFail
		@dataProvider = DataProvider.new()		
		@clientMock = MockClient.new({}, "test")
		@clientMock.payments_ok = false
		sdk = TodoPagoConector.new({}, "test")
		
		sdk.setRestConnector(@clientMock)
		optionsPaymentMethods=Hash.new
		optionsPaymentMethods[:MERCHANT]= "5555"

		response = sdk.getAllPaymentMethods(optionsPaymentMethods)

		
		assert_not_equal(@dataProvider.GetAllPaymentMethodsResponseOK, response)
	end



end