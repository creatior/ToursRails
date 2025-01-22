class Booking < ApplicationRecord
  belongs_to :client
  belongs_to :tour

  validate :date_cannot_be_in_the_past

  def date_cannot_be_in_the_past
    if booking_date.present? && booking_date < Date.today
      errors.add(:date, "cannot be in the past")
    end
  end
end
