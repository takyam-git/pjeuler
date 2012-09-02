class AddIndexScripts < ActiveRecord::Migration
  def self.up
    add_index :scripts, :dir
    add_index :scripts, :file
  end

  def self.down
    remove_index :scripts, :dir
    remove_index :scripts, :file
  end
end
