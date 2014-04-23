class AddPhotosToUsers < ActiveRecord::Migration
  def change
    create_table :photos do |t|
      t.belongs_to :user
      t.string :title
      t.datetime :photo_date
      t.timestamps
    end
  end
end
