class CreateHabits < ActiveRecord::Migration[7.2]
  def change
    create_table :habits do |t|
      t.references :task ,foreign_key:true
      t.date :end_date,null:false
      t.string :status ,null:false
      t.timestamps
    end
  end
end