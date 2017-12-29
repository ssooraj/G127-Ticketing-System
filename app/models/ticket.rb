class Ticket < ApplicationRecord
  before_create :generate_token

  protected

  def generate_token
    self.unique_id = loop do
      random_token = SecureRandom.random_number(99999)
      random_id = "ABC-#{random_token}"
      break random_id unless Ticket.exists?(unique_id: random_id)
    end
  end
end
