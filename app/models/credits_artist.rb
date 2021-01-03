class CreditsArtist < ApplicationRecord
  belongs_to :rol
  belongs_to :track
  belongs_to :artist
end
