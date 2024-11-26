FactoryBot.define do
  factory :status_transition do
    from { 1 }
    to { 1 }
  end

  factory :event do
    project { project }
    eventable { status_transition }
  end

  sequence :name do |n|
    "Display Name #{n}"
  end

  factory :project do
    name { generate(:name) }
  end
end
