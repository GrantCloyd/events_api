class Event < ApplicationRecord
    event_options = ["click", "view", "login", "exit", "share", "sign up", "payment", "refund", "search", "custom"]
    validates :name, presence: true
    validates :event_type, presence: true, inclusion: { in: event_options, message: "must be: #{event_options.join(", ")}." }
end
