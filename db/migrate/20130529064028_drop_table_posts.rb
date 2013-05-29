class DropTablePosts < ActiveRecord::Migration
  def up
    drop_table :posts
  end

  def down
  end
end
