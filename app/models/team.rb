class Team < ApplicationRecord
  has_many :profils, inverse_of: :team
  has_many :players, inverse_of: :team
end
