class CreateMarkers < ActiveRecord::Migration
  def change
    create_table :markers do |t|
      t.string :title
      t.string :location
      t.float :latitude
      t.float :longitude
      t.integer	:rating

      t.timestamps
    end
  end
end
