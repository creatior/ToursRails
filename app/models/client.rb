class Client < ApplicationRecord
  validates :name, presence: true, format: { with: /\A[А-Яа-яЁёA-Za-z\-]+\z/, message: "can only contain letters and hyphens" }
  validates :surname, presence: true, format: { with: /\A[А-Яа-яЁёA-Za-z\-]+\z/, message: "can only contain letters and hyphens" }
  validates :patronymic, format: { with: /\A[А-Яа-яЁёA-Za-z\-]+\z/, message: "can only contain letters and hyphens" }
  validates :name, format: { without: /\s/, message: "must not contain spaces" }
  validates :surname, format: { without: /\s/, message: "must not contain spaces" }
  validates :patronymic, format: { without: /\s/, message: "must not contain spaces" }
  validates :email, presence: true, format: { with: URI::MailTo::EMAIL_REGEXP, message: "invalid email address" }
  validates :phone_number, presence: true, format: { with: /\A8\d{10}\z/, message: "must start with 8 and be followed by 10 digits" }

  before_validation :capitalize_names

  private
  def capitalize_names
    self.name = format_name(name)
    self.surname = format_name(surname)
    self.patronymic = format_name(patronymic)
  end

  def format_name(name)
    return if name.blank?
    name.split("-").map(&:capitalize).join("-")
  end
end
