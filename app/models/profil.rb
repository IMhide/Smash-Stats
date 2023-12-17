class Profil < ApplicationRecord
  self.primary_key = 'startgg_id'

  validates :startgg_id, presence: true
  validates :remote_name, presence: true

  has_many :won_sets, class_name: 'GameSet', foreign_key: :winner_id, inverse_of: :winner
  has_many :lost_sets, class_name: 'GameSet', foreign_key: :looser_id, inverse_of: :looser
  has_many :won_matches, class_name: 'Match', foreign_key: :winner_id, inverse_of: :winner
  has_many :lost_matches, class_name: 'Match', foreign_key: :looser_id, inverse_of: :looser
  has_many :participations, inverse_of: :profil

  belongs_to :player, inverse_of: :profils
  belongs_to :teams, inverse_of: :profils, optional: true
end
