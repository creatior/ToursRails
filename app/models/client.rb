class Client < ApplicationRecord
  validates :name, presence: true, format: { without: /\d/, message: "must not contain digits" }
  validates :surname, presence: true, format: { without: /\d/, message: "must not contain digits" }
  validates :patronymic, presence: true, format: { without: /\d/, message: "must not contain digits" }
  validates :email, presence: true, format: { with: URI::MailTo::EMAIL_REGEXP, message: "invalid email address" }
  validates :phone_number, presence: true, format: { with: /\A8\d{10}\z/, message: "must start with 8" }
end
