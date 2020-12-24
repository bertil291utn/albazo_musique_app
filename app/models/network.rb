class Network < ApplicationRecord
  has_many :artist_networks
  has_many :artists, through: :artist_networks
end
