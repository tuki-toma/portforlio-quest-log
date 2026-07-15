class CreateTodoLists < ActiveRecord::Migration[7.2]
  def change
    create_table :todo_lists do |t|
      t.references :task,foreign_key:true
      t.datetime :deadline , null:false
      t.string :repeat_rule, null:false
      t.timestamps
    end
  end
end