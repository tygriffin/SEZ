class CreateArticles < ActiveRecord::Migration
  def change
    create_table :articles do |t|
      t.string :title
      t.text :description
      t.text :body
      t.string :author

      t.timestamps
    end
  end
end
