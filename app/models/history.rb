class History < ActiveRecord::Base
  attr_accessible :old_content, :new_content, :user_id
  
  belongs_to :user
  belongs_to :article
  
  default_scope order: 'histories.created_at DESC'
end
