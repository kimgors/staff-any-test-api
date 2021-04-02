FactoryBot.define do
  factory :shift do
    sequence(:name) { |n| "shift_#{n}" }
    sequence(:date) { |n| DateTime.current.to_date + n }
    start_time { |n| Time.now }
    end_time { |n| Time.now + 1 }
  end
end
