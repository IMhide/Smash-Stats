class Player < ApplicationRecord
  validates :name, presence: true

  has_many :profils, inverse_of: :player

  belongs_to :teams, inverse_of: :profils
end
