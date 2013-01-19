require 'spec_helper'

describe "layout" do

  subject{page}
  
  describe "Header" do
    before {visit root_path}
    it "should have correct brand in header" do
       should have_selector('div',    text: 'My Wiki') 
    end
    
    it "should have correct menu" do
       should have_link('Home', {:href => root_path})
       should have_link('Sign in', {:href => new_user_session_path})
       should have_link('Sign up', {:href => new_user_registration_path})
    end
    
    it "should have search form" do
      should have_selector("form", :class=>'navbar-search pull-right')
      should have_selector("input", :value =>"Find Article") 
    end

  end
end