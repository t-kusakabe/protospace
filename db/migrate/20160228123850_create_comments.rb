class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.string :content
      t.references :prototype
      t.references :user
      t.timestamps
    end
  end
end
