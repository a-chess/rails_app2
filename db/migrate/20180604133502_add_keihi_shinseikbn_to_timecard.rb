class AddKeihiShinseikbnToTimecard < ActiveRecord::Migration[5.2]
  def change
    add_column :timecards, :keihi_shinsei_kbn, :integer, default: 0, null: false
  end
end
