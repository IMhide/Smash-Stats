class Participation < ApplicationRecord
  belongs_to :tournament, inverse_of: :participations
  belongs_to :profil, inverse_of: :participations

  validates :placement, presence: true
  validates :seed, presence: true
end
