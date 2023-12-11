class Tournament < ApplicationRecord
  enum status: {created: 'created', waiting: 'waiting', synced: 'synced'}

  has_many :matches, inverse_of: :tournament
  has_many :participations, inverse_of: :tournament

  validates :name, presence: true
  validates :startgg_event_id, presence: true
  validates :startgg_tournament_id, presence: true
  validates :startgg_slug, presence: true
  validates :happened_at, presence: true
  # validates :is_online, presence: true
  validates :event_name, presence: true

  validates :country_code, presence: true, if: :is_offline?
  validates :state, presence: true, if: :is_offline?
  validates :zipcode, presence: true, if: :is_offline?
  validates :address, presence: true, if: :is_offline?

  validates :startgg_event_id, uniqueness: {scope: :startgg_tournament_id}

  def is_offline?
    !is_online
  end
end
