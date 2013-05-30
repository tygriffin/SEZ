class RenamePublicationsToArticles < ActiveRecord::Migration
  def change
    rename_table :publications, :articles
  end
end
