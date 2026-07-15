class Task < ApplicationRecord
    belongs_to :user
    has_one :habit,dependent: :destroy
    has_one :todo_list,dependent: :destroy
end