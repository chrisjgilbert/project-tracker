class Event < ApplicationRecord
  belongs_to :project
  delegated_type :eventable, types: %w[ Comment StatusTransition ]
end
