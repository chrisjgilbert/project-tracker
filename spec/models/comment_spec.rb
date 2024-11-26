require 'rails_helper'

RSpec.describe Comment, type: :model do
  describe "associations" do
    it { should have_one(:event).dependent(:destroy) }
  end

  describe "validations" do
    it { should validate_presence_of(:content) }
  end
end
