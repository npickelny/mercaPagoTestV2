#encoding: utf-8
class EmptyFieldException < Exception
	def initialize(data="EmptyFieldException(alg&uacute;n campo incompleto)")
		super(data)
	end
end
