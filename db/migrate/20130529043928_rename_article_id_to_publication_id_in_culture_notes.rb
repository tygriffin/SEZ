class RenameArticleIdToPublicationIdInCultureNotes < ActiveRecord::Migration
  def up
    rename_column :culture_notes, :article_id, :publication_id
  end

  def down
  end
end
