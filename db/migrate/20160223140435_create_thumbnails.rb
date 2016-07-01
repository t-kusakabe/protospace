class CreateThumbnails < ActiveRecord::Migration
  def change
    create_table :thumbnails do |t|
      t.integer :status
      t.string :thumbnail
      t.references :prototype
      t.timestamps
    end
  end
end
