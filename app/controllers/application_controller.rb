class ApplicationController < ActionController::Base
  protect_from_forgery with: :null_session
  require_relative '../../lib/todoPago/todo_pago_conector'
  require_relative '../../lib/todoPago/tp_user'
  def index; end
end
