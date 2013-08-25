class CreateFlashcardVocabs < ActiveRecord::Migration
  def change
    create_table :flashcard_vocabs do |t|
      t.string :word
      t.string :translation
      t.string :example_sentence
      t.integer :quiz_id
      t.string :vocab_type

      t.timestamps
    end
  end
end
