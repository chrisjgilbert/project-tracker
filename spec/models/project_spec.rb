require 'rails_helper'

RSpec.describe Project, type: :model do
  describe "associations" do
    it { should have_many(:events) }
    it { should have_many(:status_transitions).through(:events).source(:eventable) }
  end

  describe "validations" do
    it { should validate_presence_of(:name) }

    subject { build(:project) }
    it { should validate_uniqueness_of(:name) }
  end

  describe "enums" do
    it do
      should define_enum_for(:status)
        .with_values([:not_started, :in_progress, :complete, :cancelled])
    end
  end
end
