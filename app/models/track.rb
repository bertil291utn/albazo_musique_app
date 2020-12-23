class Track < ApplicationRecord
  belongs_to :artist
  validates :artist, presence: true
end
