class AddDateTimeToShow < ActiveRecord::Migration
  def change
    add_column :shows, :show_date, :datetime
  end
end
