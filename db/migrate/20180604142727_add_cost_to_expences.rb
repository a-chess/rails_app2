class AddCostToExpences < ActiveRecord::Migration[5.2]
  def change
    add_column :expences, :cost, :integer, default: 0, null: false
  end
end
