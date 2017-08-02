#encoding: utf-8
require_relative "../lib/todo_pago_conector.rb"
require_relative "MockClient.rb"
require_relative "DataProvider.rb"

require "test/unit"


class GetAuthorizeAnswerTest < Test::Unit::TestCase
	attr_accessor :clientMock , :dataProvider

	def testGetAuthorizeRequestOk
		@dataProvider = DataProvider.new()
		@clientMock = MockClient.new( @dataProvider.getHeader(), "test")
		sdk = TodoPagoConector.new(@dataProvider.getHeader(), "test")

		sdk.setSoapConnector(@clientMock)

		params = @dataProvider.GetAuthorizeAnswerOptions('ok')
		response = sdk.getAuthorizeAnswer(params)
		response = JSON.parse(response)

		assert_equal(@dataProvider.GetAuthorizeAnswerRequestOK(), @clientMock.getLastRequest());
		assert_equal("-1", response["envelope"]["body"]["get_authorize_answer_response"]["status_code"])

	end	

	def testGetAuthorizeRequestFail
		@dataProvider = DataProvider.new()
		@clientMock = MockClient.new( @dataProvider.getHeader(), "test")
		sdk = TodoPagoConector.new(@dataProvider.getHeader(), "test")

		sdk.setSoapConnector(@clientMock)

		params = @dataProvider.GetAuthorizeAnswerOptions('fail_required')

		response = sdk.getAuthorizeAnswer(params)
		response = JSON.parse(response)

		assert_not_equal("-1", response["envelope"]["body"]["get_authorize_answer_response"]["status_code"])
		
	end

	def testGetAuthorizeRequest702
		@dataProvider = DataProvider.new()
		@clientMock = MockClient.new( @dataProvider.getHeader(), "test")
		sdk = TodoPagoConector.new(@dataProvider.getHeader(), "test")

		sdk.setSoapConnector(@clientMock)

		params = @dataProvider.GetAuthorizeAnswerOptions('702')

		response = sdk.getAuthorizeAnswer(params)
		response = JSON.parse(response)

		assert_equal("702", response["envelope"]["body"]["get_authorize_answer_response"]["status_code"])
		
	end


end