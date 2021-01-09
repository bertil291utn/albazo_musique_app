class Dpa < ApplicationRecord
  belongs_to :state, class_name: "Dpa", foreign_key: :dpa_id, optional: true
  has_many :artists
  has_many :tracks

  scope :ordered, -> { order(description: :asc) }

  def city_provincia
    "#{description}, #{state.description}"
  end
end
