class Article < ActiveRecord::Base
  attr_accessible :content, :title, :last_editor_id, :last_edited_at
  
  validates :title,  :presence => true, :length => { :maximum => 20 }
  validates :content,  :presence => true
  
  def do_save(user)
    last_editor_id = user_id
    last_edited_at = Time.now
    save_history(user)
    save
  end
  
  def save_history(user)
    
  end
end
