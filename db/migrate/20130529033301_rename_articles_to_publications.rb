class RenameArticlesToPublications < ActiveRecord::Migration
  def change
    rename_table :articles, :publications
  end
end
