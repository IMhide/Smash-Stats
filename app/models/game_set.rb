class GameSet < ApplicationRecord
  belongs_to :winner, class_name: 'Profil', foreign_key: 'winner_id', inverse_of: 'won_sets', primary_key: 'startgg_id'
  belongs_to :looser, class_name: 'Profil', foreign_key: 'looser_id', inverse_of: 'lost_sets', primary_key: 'startgg_id'
  belongs_to :match, inverse_of: :game_sets

  validates :winner_score, presence: true
  validates :looser_score, presence: true
end
