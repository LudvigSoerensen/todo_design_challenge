class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  # Here I added my own flashtypes
  add_flash_types :error
  add_flash_types :success
end
