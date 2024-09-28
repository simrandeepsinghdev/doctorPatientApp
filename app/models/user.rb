class User < ApplicationRecord
  has_secure_password
  
  has_many :appointments, foreign_key: 'doctor_id'
  has_many :patients, through: :appointments

  validates :name, presence: true
  validates :email, presence: true, uniqueness: true
  validates :role, presence: true

  enum role: { receptionist: 'receptionist', doctor: 'doctor' }
end
