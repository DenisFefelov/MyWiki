class AddColumnsIntoArticles < ActiveRecord::Migration
  def up
    add_column :articles, :last_editor_id, :integer 

  end

  def down
  end
end
