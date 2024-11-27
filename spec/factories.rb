FactoryBot.define do
  factory :comment do
    event

    content { "MyText" }
  end

  factory :status_transition do
    event

    from { :in_progress }
    to { :complete }
  end

  factory :event do
    project

    for_comment # defaut

    trait :for_comment do
      association :eventable, factory: :comment
    end

    trait :for_status_transition do
      association :eventable, factory: :status_transition
    end
  end

  sequence :name do |n|
    "Display Name #{n}"
  end

  factory :project do
    name { generate(:name) }
  end
end
