# encoding: utf-8
class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_filter :authenticate_client!

  protected
    def current_client
      @current_client ||= Client.find(session[:client_id]) if session[:client_id]
    end
    helper_method :current_client

    def authenticate_client!
      if current_client.nil?
        redirect_to login_path, alert: 'Proszę się zalogować.'
      end
    end
end
