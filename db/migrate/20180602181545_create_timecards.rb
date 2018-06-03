class CreateTimecards < ActiveRecord::Migration[5.2]
  def change
    create_table :timecards do |t|
      t.references :user, null: false
      t.string :target_month, null: false
      t.integer :shinsei_kbn, default: 0
      
      t.timestamps
    end
    
    add_index :timecards, [:user_id, :target_month], unique: true
  end
end
