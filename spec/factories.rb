FactoryBot.define do
  sequence :name do |n|
    "Display Name #{n}"
  end

  factory :project do
    name { generate(:name) }
  end
end
