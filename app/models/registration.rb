class Registration < ApplicationRecord
  belongs_to :user
  belongs_to :event

  def set_total_price
    price_of_event = event.price.to_i
    amount_of_guests = self.guests_count.to_i
    self.price = price_of_event * amount_of_guests
  end

end
