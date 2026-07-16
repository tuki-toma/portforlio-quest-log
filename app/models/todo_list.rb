class TodoList < ApplicationRecord
    belongs_to :task
    accepts_nested_attributes_for :task

    enum :repeat_rule,{ daily:0,weekly:1,monthly:2,unique:3}
end