Gem::Specification.new do |s|
  s.name = 'TodoPagoConector'
  s.version = '1.7.0'
  s.date = '2016-10-13'
  s.summary="test conector"
  s.description = "Conector para la plataforma de pagos"
  s.authors = ["Softtek"]
  s.files = ["lib/todo_pago_conector.rb"]
  s.add_runtime_dependency "savon", ["= 2.8.1"]
  s.add_runtime_dependency "rest-client", ["= 1.8.0"]
  s.add_runtime_dependency "json"
end
