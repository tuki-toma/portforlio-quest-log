class Habit < ApplicationRecord
    belongs_to :task
    accepts_nested_attributes_for :task

    enum :status,{ active:0,paused:1,completed:2,archived:3},default: :active
end