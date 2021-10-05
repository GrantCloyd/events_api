class Event < ApplicationRecord
    validates :name, presence: true, :event_type, presnce: true
end
