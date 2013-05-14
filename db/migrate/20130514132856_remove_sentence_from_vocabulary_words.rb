class RemoveSentenceFromVocabularyWords < ActiveRecord::Migration
  def up
    remove_column :vocabulary_words, :sentence
  end

  def down
    add_column :vocabulary_words, :sentence, :string
  end
end
