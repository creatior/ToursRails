class Booking < ApplicationRecord
  belongs_to :client
  belongs_to :tour

  validates :client_id, presence: { message: "must be selected" }
  validates :tour_id, presence: { message: "must be selected" }
  validate :booking_date_cannot_be_in_the_past

  def booking_date_cannot_be_in_the_past
    if booking_date.present? && booking_date < Date.today
      errors.add(:booking_date, "cannot be in the past")
    end
  end
end
