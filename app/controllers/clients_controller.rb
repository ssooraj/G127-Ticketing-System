class ClientsController < ApplicationController
  before_action :set_client, except: :new

  def new
    @client = Client.new
  end

  def create
    @client = Client.find_or_create_by(email: client_params[:email])
    @client.update_attributes(client_params)
    cookies[:user_name] = @client.email
    redirect_to tickets_clients_path
  end

  def tickets
    @tickets = @client.tickets
  end

  private

  def client_params
    params.require(:client).permit(:name, :email)
  end

  def set_client
    @client = Client.find_by_email(cookies[:user_name])
  end

end
