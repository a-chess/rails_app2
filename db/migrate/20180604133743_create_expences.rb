class CreateExpences < ActiveRecord::Migration[5.2]
  def change
    create_table :expences do |t|
      t.references :timecard
      t.integer :expence_kbn, default: 0, null: false
      t.date :date, null: false
      t.string :memo
      
      t.timestamps
    end
  end
end
