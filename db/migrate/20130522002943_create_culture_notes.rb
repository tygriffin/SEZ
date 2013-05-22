class CreateCultureNotes < ActiveRecord::Migration
  def change
    create_table :culture_notes do |t|
      t.string :title
      t.text :body
      t.integer :article_id
      t.string :instance

      t.timestamps
    end
  end
end
