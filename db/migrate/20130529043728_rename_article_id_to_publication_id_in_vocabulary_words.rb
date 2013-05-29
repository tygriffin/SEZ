class RenameArticleIdToPublicationIdInVocabularyWords < ActiveRecord::Migration
  def up
    rename_column :vocabulary_words, :article_id, :publication_id
  end

  def down
  end
end
