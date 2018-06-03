class CreateTimecardDetails < ActiveRecord::Migration[5.2]
  def change
    create_table :timecard_details do |t|
      t.references :timecard, null: false
      t.date :target_date
      t.integer :kinmu_jokyo, default: 0
      t.time :start_time, default: '9:00'
      t.time :end_time, default: '18:00'
      t.integer :break_time, default: 60
      t.string :memo
    
      t.timestamps
    end
  end
end
