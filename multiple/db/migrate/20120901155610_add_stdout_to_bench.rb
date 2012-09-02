class AddStdoutToBench < ActiveRecord::Migration
  def change
    add_column :benches, :stdout, :text
  end
end
