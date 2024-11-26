require 'rails_helper'

RSpec.describe Project, type: :model do
  describe "validations" do
    it { should validate_presence_of(:display_name) }

    subject { build(:project) }
    it { should validate_uniqueness_of(:display_name) }
  end
end
