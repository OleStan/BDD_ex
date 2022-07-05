require 'faker'
FactoryBot.define do
  factory :post do
    title { Faker::TvShows::TwinPeaks.location }
    content { Faker::TvShows::TwinPeaks.quote }

    trait :visible do
      visibility { true }
    end

    trait :hidden do
      visibility { false }
    end
  end
end
