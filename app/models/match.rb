class Match < ApplicationRecord
  belongs_to :winner, class_name: 'Profil', foreign_key: 'winner_id', inverse_of: 'won_matches',
    primary_key: 'startgg_id'
  belongs_to :looser, class_name: 'Profil', foreign_key: 'looser_id', inverse_of: 'lost_matches',
    primary_key: 'startgg_id'
  belongs_to :tournament, inverse_of: 'matches'

  has_many :game_sets, inverse_of: :match

  validates :winner_score, presence: true
  validates :looser_score, presence: true
  validates :completed_at, presence: true

  accepts_nested_attributes_for :game_sets
end
