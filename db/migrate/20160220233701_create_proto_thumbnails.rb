class CreateProtoThumbnails < ActiveRecord::Migration
  def change
    create_table :proto_thumbnails do |t|
      t.string :main_thumbnail
      t.string :sub_thumbnail1
      t.string :sub_thumbnail2
      t.integer :prototype_id
      t.timestamps
    end
  end
end
