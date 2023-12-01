FactoryBot.define do
  factory :game_set do
    winner_score { 1 }
    looser_score { 1 }
    stage { "MyString" }
    winner_character { "MyString" }
    looser_character { "MyString" }
    match { nil }
  end
end
