class AddImageAttributionToArticles < ActiveRecord::Migration
  def change
    add_column :articles, :image_attribution, :string
  end
end
