class StatusTransition < ApplicationRecord
  has_one :event, as: :eventable, dependent: :destroy

  enum :from, Project.statuses.keys.map(&:to_sym), prefix: true, validate: true
  enum :to, Project.statuses.keys.map(&:to_sym), prefix: true, validate: true

  validates :from, presence: true
  validates :to, presence: true

  validate :unique_transition_per_project

  # TODO: also validate that the project status is the from...

  private

  def unique_transition_per_project
    if from == to
      errors.add(:base, "'from' and 'to' statuses cannot be the same within the same project")
    end
  end
end
