class RemoveTypeFromArticles < ActiveRecord::Migration
  def up
    remove_column :articles, :type
  end

  def down
    add_column :articles, :type, :string
  end
end
