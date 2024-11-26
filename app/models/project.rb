class Project < ApplicationRecord
  validates :display_name, presence: true, uniqueness: true
end
