class RemoveQuizGameFromArticles < ActiveRecord::Migration
  def up
    remove_column :articles, :quiz_game
  end

  def down
    add_column :articles, :quiz_game, :string
  end
end
