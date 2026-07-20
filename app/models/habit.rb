class Habit < ApplicationRecord
    belongs_to :task
    accepts_nested_attributes_for :task

    enum :status,{ active:0,paused:1,completed:2,archived:3},default: :active

    validates :status,presence:true

    validate :end_date_cannot_be_in_the_past

    def end_date_cannot_be_in_the_past
        if end_date.present? && end_date < Date.current
        errors.add(:end_date, "は今日以降の日付にしてください")
        end
    end
end