FactoryGirl.define do
  factory :todo do
    title { ["Become president of the USA",
             "Invent a perpetual motion machine",
             "Discover the source of consciousness in the human brain",
             "Do the dishes"
            ].sample }
    is_completed { [true, false].sample }
  end
end
