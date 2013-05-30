class RenamePublicationIdToArticleIdInTags < ActiveRecord::Migration
  def change
    rename_column :tags, :publication_id, :article_id
  end
end
