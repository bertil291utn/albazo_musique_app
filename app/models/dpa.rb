class Dpa < ApplicationRecord
  belongs_to :dpa, optional: true
  has_many :artists
  has_many :tracks

  scope :ordered, -> { order(description: :asc) }

  def city_provincia
    "#{description}, #{dpa.description}"
  end
end
