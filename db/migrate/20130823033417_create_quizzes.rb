class CreateQuizzes < ActiveRecord::Migration
  def change
    create_table :quizzes do |t|
      t.string :name
      t.text :description
      t.integer :article_id
      t.integer :topic_id
      t.string :quiz_type

      t.timestamps
    end
  end
end
