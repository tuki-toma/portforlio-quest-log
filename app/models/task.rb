class Task < ApplicationRecord
    belongs_to :user
    has_one :habit,dependent: :destroy
    has_one :todo_list,dependent: :destroy
    has_many :completions
    
    def keep_count
        before = nil
        sum = 0
        max_count = 0
        orderd_completions = completions.order(created_at: :asc)
        orderd_completions.each do |completion|
            if before == nil
                before = completion.created_at.to_date
                sum += 1
                max_count = sum
            else 
                if completion.created_at.to_date - before == 1
                    before = completion.created_at.to_date
                    sum += 1
                    if sum > max_count
                        max_count = sum
                    end
                else
                    before = completion.created_at.to_date
                    sum = 1
                end
            end
        end
        max_count
    end
end