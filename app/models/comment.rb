class Comment < ApplicationRecord
  has_one :event, as: :eventable, dependent: :destroy

  validates :content, presence: true
end
