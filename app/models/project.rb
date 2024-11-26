class Project < ApplicationRecord
  has_many :events, dependent: :destroy
  has_many :status_transitions, through: :events, source: :eventable, source_type: "StatusTransition"
  has_many :comments, through: :events, source: :eventable, source_type: "Comment"

  validates :name, presence: true, uniqueness: true

  enum :status, [:not_started, :in_progress, :complete, :cancelled], default: :not_started, validate: true
end
