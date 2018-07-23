class Location < ApplicationRecord
  belongs_to :user

  validates :latitude, presence: true, numericality: true
  validates :longitude, presence: true, numericality: true
end
