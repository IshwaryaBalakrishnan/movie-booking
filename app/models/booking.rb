class Booking < ApplicationRecord
  belongs_to :movie
  validates :name, presence: true
  validates :email, presence: true
  validates :seats, presence: true, numericality: { greater_than: 0 }
end
