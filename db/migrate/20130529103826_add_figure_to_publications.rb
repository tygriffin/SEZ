class AddFigureToPublications < ActiveRecord::Migration
  def change
    add_column :publications, :figure, :text
  end
end
