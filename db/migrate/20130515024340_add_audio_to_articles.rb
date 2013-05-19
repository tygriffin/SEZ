class AddAudioToArticles < ActiveRecord::Migration
  def change
    add_column :articles, :audio, :string
  end
end
