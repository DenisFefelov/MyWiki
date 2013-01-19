class AddColumnsIntoArticles < ActiveRecord::Migration
  def up
    add_column :articles, :last_editor_id, :integer 
    add_column :articles, :last_edited_at, :datetime
  end

  def down
  end
end
