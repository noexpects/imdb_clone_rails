FactoryBot.define do
  factory :review do
    score { rand(Constants::Review::SCORE_MINIMUM_VALUE..Constants::Review::SCORE_MAXIMUM_VALUE) }
    user
    movie
  end
end
