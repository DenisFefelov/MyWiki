class Article < ActiveRecord::Base
  extend FriendlyId
  friendly_id :title, use: [:slugged, :history], :sequence_separator=> '+'
  
  attr_accessible :content, :title, :last_editor_id, :slug
  
  validates :title,  :presence => true, :length => { :maximum => 50 }
  validates :content,  :presence => true
  
  belongs_to :last_editor, class_name:  "User", foreign_key: "last_editor_id"
  
  has_many :histories
  
    
  def save_history(user, old_content)
    histories.create!(:user_id => user.id, :old_content=> old_content, :new_content=>content)
  end
  
  def normalize_friendly_id(string)    
    super.gsub("-", "+")  
  end
  
  
end
