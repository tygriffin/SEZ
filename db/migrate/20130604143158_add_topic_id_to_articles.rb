class AddTopicIdToArticles < ActiveRecord::Migration
  def change
    add_column :articles, :topic_id, :integer
  end
end
