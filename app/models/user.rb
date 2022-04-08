class User < ApplicationRecord
  has_many :bookings, dependent: :destroy
end
