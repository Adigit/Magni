class AddVidToVenue < ActiveRecord::Migration
  def change
    add_column :venues, :vid, :integer
  end
end
