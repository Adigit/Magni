class CreateShows < ActiveRecord::Migration
  def change
    create_table :shows do |t|
      t.string :name
      t.integer :reservation_allowed

      t.timestamps null: false
    end
  end
end
