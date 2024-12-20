require "rails_helper"

RSpec.describe Event, type: :model do
  describe "associations" do
    it { should belong_to(:project) }
    it { should belong_to(:eventable) }
  end
end
