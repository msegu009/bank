class AccountsController < ApplicationController
  before_filter :find_client
  before_filter :find_account, only: [:show, :destroy]

  def index
    @accounts = @client.accounts.order('id').page(params[:page])
  end

  def show
  end

  def create
    @account = @client.accounts.create!
    redirect_to client_accounts_path(@client)
  end

  def destroy
    @account.destroy
    redirect_to client_accounts_path(@client)
  end

  private
    def find_client
      @client = current_client
    end

    def find_account
      @account = @client.accounts.find(params[:id])
    end
end
