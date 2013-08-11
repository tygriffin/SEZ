class CreateStudyNotes < ActiveRecord::Migration
  def change
    create_table :study_notes do |t|
      t.string :title
      t.text :body
      t.string :instance
      t.integer :article_id

      t.timestamps
    end
  end
end
