#encoding: utf-8
require_relative "Exceptions/empty_field_user_exception"
require_relative "Exceptions/empty_field_password_exception"

class TpUser
  attr_accessor :merchant, :apiKey
  attr_reader :user, :password

  def initialize(user=nil, password=nil)
  	@user= user
	@password= password
  end

def as_json(options={})
    {
        merchant: @merchant,
        apikey: @apiKey
    }
end

def to_json(*options)
    as_json(*options).to_json(*options)
end

def getData
	if(@user==nil)
		raise EmptyFieldUserException.new
	end

	if (@password==nil)
		raise EmptyFieldPasswordException.new
	end

	data = {:USUARIO=>@user, :CLAVE=>@password}
	
	return data
end

end

