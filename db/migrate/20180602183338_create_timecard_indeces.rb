class CreateTimecardIndeces < ActiveRecord::Migration[5.2]
  def change
    create_table :timecard_indeces do |t|
      t.string :target_month,null:false,unique: true 
      
      t.timestamps
    end
  end
end
