FactoryBot.define do
  factory :participation do
    tournament { nil }
    profil { nil }
    placement { 1 }
    seed { 1 }
    verified { false }
    dq { false }
  end
end
