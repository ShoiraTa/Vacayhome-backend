class House < ApplicationRecord
  has_many :bookings, dependent: :destroy
  validates :name, presence: true
  validates :price, presence: true
  validates :description, presence: true
  validates :country, presence: true
  validates :city, presence: true
  validates :address, presence: true
  validates :property_type, presence: true
  validates :image_url, presence: true
end
