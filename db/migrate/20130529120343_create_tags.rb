class CreateTags < ActiveRecord::Migration
  def change
    create_table :tags do |t|
      t.string :name
      t.references :publication

      t.timestamps
    end
    add_index :tags, :publication_id
  end
end
