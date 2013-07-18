class CreateAuthors < ActiveRecord::Migration
  def change
    create_table :authors do |t|
      t.string :name
      t.text :bio
      t.string :website
      t.string :image

      t.timestamps
    end
  end
end
