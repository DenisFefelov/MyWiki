class CreateHistories < ActiveRecord::Migration
  def change
    create_table :histories do |t|
      t.integer :article_id
      t.integer :user_id
      t.text :new_content
      t.text :old_content
      t.timestamps
    end
  end
end
