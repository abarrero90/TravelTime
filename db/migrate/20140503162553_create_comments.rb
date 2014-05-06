class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.string :text
      t.belongs_to :users
      t.timestamps
    end
  end
end
