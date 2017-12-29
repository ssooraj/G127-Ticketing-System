class Ticket < ApplicationRecord
  enum status: ["Waiting for Staff Response", "Waiting for Customer", "On Hold", "Cancelled", "Completed"]
  before_create :generate_token
  before_create :set_status

  protected

  def generate_token
    self.unique_id = loop do
      random_token = SecureRandom.random_number(99999)
      random_id = "ABC-#{random_token}"
      break random_id unless Ticket.exists?(unique_id: random_id)
    end
  end

  def set_status
    self.status = Ticket.statuses['Waiting for Staff Response']
  end
end
