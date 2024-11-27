require 'rails_helper'

RSpec.describe StatusTransitionsHelper, type: :helper do
  describe "#options_for_status_transition" do
    it "returns the options for a status transition" do
      result = helper.options_for_status_transition

      expect(result).to eq([
        ["Not started", "not_started"],
        ["In progress", "in_progress"],
        ["Complete", "complete"],
        ["Cancelled", "cancelled"]
      ])
    end
  end
end
