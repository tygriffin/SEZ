class AddFlagMessageToArticles < ActiveRecord::Migration
  def change
    add_column :articles, :flag_message, :string
  end
end
