class Dpa < ApplicationRecord
  belongs_to :dpa, optional: true
  has_many :artists
end
