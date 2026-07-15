class CreateCompletions < ActiveRecord::Migration[7.2]
  def change
    create_table :completions do |t|
      t.references :task ,foreign_key:true
      t.date :completed_at
      t.timestamps
    end
  end
end