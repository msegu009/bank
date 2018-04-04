# encoding: utf-8
class TransactionsController < ApplicationController
  before_filter :find_account

  def index
    @transactions = @account.transactions.order('id desc').page(params[:page])
  end

  def new
    @transaction = @account.transactions.new
  end

  def create
    @transaction = @account.transactions.new(transaction_params)
    if @transaction.save
      redirect_to [@client, @account], notice: 'Transakcja zapisana'
    else
      render action: 'new'
    end
  end

  private
    def find_account
      @client = current_client
      @account = @client.accounts.find(params[:account_id])
    end

    def transaction_params
      params.require(:transaction).permit(:amount, :descr)
    end
end
