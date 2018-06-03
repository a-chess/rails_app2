class CreateGenerics < ActiveRecord::Migration[5.2]
  def change
    create_table :generics do |t|
      t.string :kbn, null: false
      t.integer :key1, null: false
      t.string :data1, null: false  
      
      t.timestamps
    end
    
    add_index :generics, [:kbn, :key1], unique: true
  end
end
