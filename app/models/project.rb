class Project < ApplicationRecord
  validates :name, presence: true, uniqueness: true

  enum :status, [:not_started, :in_progress, :complete, :cancelled], default: :not_started, validate: true
end
