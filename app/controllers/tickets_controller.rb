class TicketsController < ApplicationController

  def index
    @tickets = Ticket.page params[:page]
  end

  def new
    @ticket = Ticket.new
  end

  def create
    @client = Client.find_by_email(cookies[:user_name])
    ticket = @client.tickets.new(ticket_params)
    if ticket.save
      redirect_to tickets_clients_path
    else
      render 'new'
    end
  end

  private

  def ticket_params
    params.require(:ticket).permit(:subject, :department, :description)
  end
end
