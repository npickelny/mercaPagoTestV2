#encoding: utf-8
require_relative "../lib/todo_pago_conector.rb"
require_relative "MockClient.rb"
require_relative "DataProvider.rb"


require "test/unit"


class GetOperationsTest < Test::Unit::TestCase
	attr_accessor :clientMock , :dataProvider

	def testGetOperationsOk
		@dataProvider = DataProvider.new()
		@clientMock = MockClient.new( @dataProvider.getHeader(), "test")
		sdk = TodoPagoConector.new(@dataProvider.getHeader(), "test")

		sdk.setRestConnector(@clientMock)

		optionsOperations = @dataProvider.GetOperationsOptions('ok')

		response = sdk.getOperations(optionsOperations)
		response = @clientMock.xml_to_hash(response)

		assert_equal(@dataProvider.GetOperationsRequestOk(), @clientMock.getLastRequest());
		assert_equal("-1", response["Operations"][0]["RESULTCODE"][0]) 
		
	end

	def testGetOperationsFail
		@dataProvider = DataProvider.new()
		@clientMock = MockClient.new( @dataProvider.getHeader(), "test")
		sdk = TodoPagoConector.new(@dataProvider.getHeader(), "test")

		sdk.setRestConnector(@clientMock)

		optionsOperations = @dataProvider.GetOperationsOptions('fail')

		response = sdk.getOperations(optionsOperations)
		response = @clientMock.xml_to_hash(response)
		
		assert_not_equal("-1", response["Status"])

	end

	def testGetByRangeDateTimeOk
		@dataProvider = DataProvider.new()
		@clientMock = MockClient.new( @dataProvider.getHeader(), "test")
		sdk = TodoPagoConector.new(@dataProvider.getHeader(), "test")

		sdk.setRestConnector(@clientMock)
		optionsGBRDT = @dataProvider.GetByRangeDateTimeOptions('ok')
		
		response = sdk.getByRangeDateTime(optionsGBRDT)
		assert_equal(@dataProvider.GetByRangeDateTimeResponseOk, response)

	end

	def testGetByRangeDateTimeFail
		@dataProvider = DataProvider.new()
		@clientMock = MockClient.new( @dataProvider.getHeader(), "test")
		sdk = TodoPagoConector.new(@dataProvider.getHeader(), "test")

		sdk.setRestConnector(@clientMock)
		optionsGBRDT = @dataProvider.GetByRangeDateTimeOptions('fail')
		
		response = sdk.getByRangeDateTime(optionsGBRDT)
		assert_not_equal(@dataProvider.GetByRangeDateTimeResponseOk, response)

	end

end