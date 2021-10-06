class Event < ApplicationRecord
    validates :name, presence: true
    validates :event_type, presence: true, inclusion: { in: ["click", "view", "login", "exit", "share", "sign up", "payment", "refund", "search", "custom"]}
end
