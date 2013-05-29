class AddPubtypeToArticles < ActiveRecord::Migration
  def change
    add_column :articles, :pubtype, :string
  end
end
