class Patient < ApplicationRecord
  has_many :appointments
  has_many :doctors, through: :appointments

  validates :name, presence: true
  validates :age, presence: true
  validates :contact, presence: true
  validates :address, presence: true
end
