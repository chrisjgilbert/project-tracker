require "rails_helper"

RSpec.describe StatusTransition, type: :model do
  describe "associations" do
    it { should have_one(:event).dependent(:destroy) }
  end

  describe "validations" do
    it { should validate_presence_of(:from) }
    it { should validate_presence_of(:to) }

    it "validates that from and to are different" do
      create(:project)
      transition = build(:status_transition, from: :not_started, to: :not_started)

      expect(transition).to_not be_valid
      expect(transition.errors[:base]).to include("'from' and 'to' statuses cannot be the same within the same project")
    end
  end
end
