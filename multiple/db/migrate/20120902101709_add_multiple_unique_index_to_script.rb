class AddMultipleUniqueIndexToScript < ActiveRecord::Migration
  def self.up
    add_index :scripts, [:dir, :file], :unique => true
  end

  def self.down
    remove_index :scripts, [:dir, :file]
  end
end