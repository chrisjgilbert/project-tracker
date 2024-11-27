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

  describe "#ordered_events" do
    it "returns the events ordered by created_at" do
      project = create(:project)
      event1 = create(:event, :for_comment, project: project, created_at: 1.day.ago)
      event2 = create(:event, :for_status_transition, project: project, created_at: 1.hour.ago)
      event3 = create(:event, :for_comment, project: project, created_at: 1.minute.ago)

      result = project.ordered_events.map(&:id)

      expect(result).to eq([event3.id, event2.id, event1.id])
    end
  end

  describe "#update_status!" do
    it "creates a new status transition and updates the project status" do
      project = create(:project, status: :not_started)

      project.update_status!(:in_progress)

      expect(project.status).to eq("in_progress")
      expect(project.status_transitions.last.from).to eq("not_started")
      expect(project.status_transitions.last.to).to eq("in_progress")
    end
  end
end
