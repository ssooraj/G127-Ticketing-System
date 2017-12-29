class TicketsController < ApplicationController

  def index
    @tickets = Ticket.page params[:page]
  end

  def new
    @ticket = Ticket.new
  end

  def create
    ticket = Ticket.create(ticket_params)
    redirect_to tickets_clients_path
  end

  private

  def ticket_params
    params.require(:ticket).permit(:subject, :department, :description)
  end
end
