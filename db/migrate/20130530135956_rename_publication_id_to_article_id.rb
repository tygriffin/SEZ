class RenamePublicationIdToArticleId < ActiveRecord::Migration
  def change
    rename_column :vocabulary_words, :publication_id, :article_id
    rename_column :culture_notes, :publication_id, :article_id
  end
end
