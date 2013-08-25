class AddQuizGameToArticles < ActiveRecord::Migration
  def change
    add_column :articles, :quiz_game, :string
  end
end
