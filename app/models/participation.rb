class Participation < ApplicationRecord
  belongs_to :tournament, inverse_of: :participations
  belongs_to :profil, inverse_of: :participations, primary_key: 'startgg_id', foreign_key: 'profil_id'

  validates :placement, presence: true
  validates :seed, presence: true
end
