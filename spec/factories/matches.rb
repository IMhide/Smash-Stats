FactoryBot.define do
  factory :match do
    winner_score { 1 }
    looser_score { 1 }
    completed_at { "2023-12-01 13:11:03" }
  end
end
