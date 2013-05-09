class CreateVocabularyWords < ActiveRecord::Migration
  def change
    create_table :vocabulary_words do |t|
      t.string :word
      t.string :definition
      t.string :translation
      t.string :part_of_speech
      t.integer :article_id

      t.timestamps
    end
  end
end
