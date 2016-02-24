class CreatePrototypes < ActiveRecord::Migration
  def change
    create_table :prototypes do |t|
      t.text :title
      t.string :catch_copy
      t.string :concept
      t.integer :user_id
      t.timestamps
    end
  end
end
