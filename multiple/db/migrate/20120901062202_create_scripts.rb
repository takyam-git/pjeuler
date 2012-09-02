class CreateScripts < ActiveRecord::Migration
  def change
    create_table :scripts do |t|
      t.string :dir, :null => false
      t.string :file, :null => false
      t.float :recent, :default => 999.999
      t.integer :times, :default => 0
      t.boolean :is_deleted, :default => 0

      t.timestamps
    end
  end
end
