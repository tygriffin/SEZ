class AddPubdateToArticles < ActiveRecord::Migration
  def change
    add_column :articles, :pubdate, :date
  end
end
