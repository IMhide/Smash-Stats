class Tournament < ApplicationRecord
  has_many :matches, inverse_of: :tournament
  has_many :participations, inverse_of: :tournament

  validates :name, presence: true
  validates :startgg_event_id, presence: true
  validates :startgg_tournament_id, presence: true
  validates :startgg_slug, presence: true
  validates :happened_at, presence: true

  validates :startgg_event_id, uniqueness: {scope: :startgg_tournament_id}
end
