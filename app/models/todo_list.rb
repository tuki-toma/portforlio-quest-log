class TodoList < ApplicationRecord
    belongs_to :task
    accepts_nested_attributes_for :task

    enum :repeat_rule,{ daily:0,weekly:1,monthly:2,unique:3}

    validates :repeat_rule, presence: true

    validate :deadline_cannot_be_in_the_past

    def deadline_cannot_be_in_the_past
        if deadline.present? && deadline < Date.current
        errors.add(:deadline, "は今日以降の日付にしてください")
        end
    end
end