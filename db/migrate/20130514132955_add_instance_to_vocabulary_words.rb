class AddInstanceToVocabularyWords < ActiveRecord::Migration
  def change
    add_column :vocabulary_words, :instance, :string
  end
end
