#encoding: utf-8
class ConnectionException < Exception
	def initialize(data="ConnectionException(error en la conexi&oacute;n)")
		super(data)
	end
end
