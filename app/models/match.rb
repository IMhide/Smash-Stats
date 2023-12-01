class Match < ApplicationRecord
  belongs_to :winner, class_name: 'Profil', foreign_key: 'winner_id', inverse_of: 'won_matches'
  belongs_to :looser, class_name: 'Profil', foreign_key: 'looser_id', inverse_of: 'lost_matches'
  belongs_to :tournament, inverse_of: 'matches'

  has_many :tournament, inverse_of: :matches

  validates :winner_score, presence: true
  validates :looser_score, presence: true
  validates :completed_at, presence: true
end
