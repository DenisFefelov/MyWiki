class AddSlugToArticles < ActiveRecord::Migration
  def change
    add_column :articles, :slug, :string
    add_index :articles, :slug
    add_index :articles, :title
  end
end
