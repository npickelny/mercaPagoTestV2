#encoding: utf-8
require_relative "../lib/todo_pago_conector.rb"
require_relative "../lib/Classes/user.rb"
require_relative "MockClient.rb"
require_relative "DataProvider.rb"

require "test/unit"


class GetCredentialsTest < Test::Unit::TestCase
	attr_accessor :clientMock , :dataProvider

	def testGetCredentialsOk
		@dataProvider = DataProvider.new()
		
		@clientMock = MockClient.new({}, "test")
		sdk = TodoPagoConector.new({}, "test")

		sdk.setRestConnector(@clientMock)

		params = @dataProvider.GetCredentialsOptions('ok')

		u = User.new(params[:user], params[:password])
		
		response = sdk.getCredentials(u)
	  #  assert_equal(@dataProvider.GetOperationsRequestOk(), @clientMock.getLastRequest());
		assert_instance_of(User,response)
		assert_equal(2153, response.merchant)
		assert_equal("TODOPAGO f3d8b72c94ab4a06be2ef7c95490f7d3", response.apiKey)
	

	end

	def testGetCredentialsFailUser
		@dataProvider = DataProvider.new()
		
		@clientMock = MockClient.new({}, "test")
		sdk = TodoPagoConector.new({}, "test")

		sdk.setRestConnector(@clientMock)

		params = @dataProvider.GetCredentialsOptions('failUser')

		u = User.new(params[:user], params[:password])

		response = sdk.getCredentials(u)
			  	
		assert_equal(1050, response['Credentials']['resultado']['codigoResultado'])

	end

	def testGetCredentialsFailPassword
		@dataProvider = DataProvider.new()
		
		@clientMock = MockClient.new({}, "test")
		sdk = TodoPagoConector.new({}, "test")

		sdk.setRestConnector(@clientMock)

		params = @dataProvider.GetCredentialsOptions('failPassword')

		u = User.new(params[:user], params[:password])

		response = sdk.getCredentials(u)
		assert_equal(1055, response['Credentials']['resultado']['codigoResultado'])
		
	end


end