class AddSentenceToVocabularyWords < ActiveRecord::Migration
  def change
    add_column :vocabulary_words, :sentence, :string
  end
end
