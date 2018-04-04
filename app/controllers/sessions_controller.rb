# encoding: utf-8
class SessionsController < ApplicationController
  skip_before_filter :authenticate_client!, except: [:destroy]

  def new
  end

  def create
    client = Client.find_by_email(params[:email])
    if client && client.authenticate(params[:password])
      session[:client_id] = client.id
      redirect_to client_accounts_path(client), notice: 'Witamy :)'
    else
      flash.now.alert = 'Błędny email i/lub hasło :('
      render action: 'new'
    end
  end

  def destroy
    session[:client_id] = nil
    redirect_to root_path, notice: 'Do zobaczenia...'
  end
end
