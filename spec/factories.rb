FactoryBot.define do
  sequence :display_name do |n|
    "Display Name #{n}"
  end

  factory :project do
    display_name { generate(:display_name) }
  end
end
