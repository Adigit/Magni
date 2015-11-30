class AddShowConfig < ActiveRecord::Migration
  def change
    add_column :shows, :sid, :integer
    add_column :shows, :v_id, :integer
  end
end
