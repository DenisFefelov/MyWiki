class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :username
  # attr_accessible :title, :body
  
  #VALID_NAME_REGEX = /^[-\w\._]+$/i #/([a-zA-Z0-9](_|-| )[a-zA-Z0-9])*/i
  validates :username,  :presence => true, 
                        :length => { :maximum => 20 },
                        :username=>true 
                        #:format=>{:with => VALID_NAME_REGEX, :message => "should only contain letters, numbers, underscore, hyphen"} 
  
 
   has_many :last_edited_articles, foreign_key: "last_editor_id",
                  class_name:  "Article"


  has_many :histories
end
