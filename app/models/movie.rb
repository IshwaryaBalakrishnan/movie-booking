class Movie < ApplicationRecord
  has_many :bookings
  validates :title, presence: true
  validates :genre, presence: true
  validates :duration, presence: true
end
