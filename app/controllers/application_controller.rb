require_relative '../../lib/todoPago/tp_user'
require_relative '../../lib/todoPago/todo_pago_conector'

class ApplicationController < ActionController::Base
  protect_from_forgery with: :null_session
  def index; end
end
