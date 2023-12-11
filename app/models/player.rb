class Player < ApplicationRecord
  validates :name, presence: true

  has_many :profils, inverse_of: :player

  belongs_to :team, inverse_of: :players, optional: true
end
