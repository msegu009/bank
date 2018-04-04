# encoding: utf-8
class ClientsController < ApplicationController
  before_action :disabled, except: [:new, :create]
  skip_before_action :authenticate_client!, only: [:new, :create]
  before_action :set_client, only: [:show, :edit, :update, :destroy]

  # GET /clients
  def index
    @clients = Client.all.page(params[:page])
  end

  # GET /clients/1
  def show
  end

  # GET /clients/new
  def new
    @client = Client.new
  end

  # GET /clients/1/edit
  def edit
  end

  # POST /clients
  def create
    @client = Client.new(client_params)

    if @client.save
      ClientMailer.welcome(@client).deliver
      redirect_to login_path, notice: 'Client was successfully created.'
    else
      render action: 'new'
    end
  end

  # PATCH/PUT /clients/1
  def update
    if @client.update(client_params)
      redirect_to @client, notice: 'Client was successfully updated.'
    else
      render action: 'edit'
    end
  end

  # DELETE /clients/1
  def destroy
    @client.destroy
    redirect_to clients_url, notice: 'Client was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_client
      @client = Client.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def client_params
      params.require(:client).permit(:name, :surname, :email, :phone,
                                     :password, :password_confirmation)
    end

    def disabled
      raise 'Disabled!!!'
    end
end
