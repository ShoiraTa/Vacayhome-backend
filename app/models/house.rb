class House < ApplicationRecord
  has_many :bookings
  validates :name, presence: true
  validates :price, presence: true
  validates :description, presence: true
  validates :location, presence: true
  validates :image_url, presence: true
end
