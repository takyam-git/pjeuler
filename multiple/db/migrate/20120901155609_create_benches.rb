class CreateBenches < ActiveRecord::Migration
  def change
    create_table :benches do |t|
      t.integer :script_id, :null => false
      t.float :result, :null => false

      t.timestamps
    end
  end
end
