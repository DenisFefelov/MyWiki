require 'spec_helper'

describe "Articles" do
  subject{page}
  
  describe "Index" do
    before {visit root_path}
    
    it "should have New button" do
       should have_link('New Article', {:href => new_article_path})
    end
    
    describe "when not logged in" do
      before { click_link "New Article" }
      it { should have_selector('h2',    text: 'Sign in') } 
    end
    
    describe "when logged in" do
      before do 
        @user = FactoryGirl.create(:user)
        login_as @user, scope: :user
        visit root_path
        click_link "New Article" 
      end  
      it { should have_selector('h1',    text: 'Create new article') } 
      it { should have_button('Create')}
      
      describe "with invalid information" do
        it "should not create a article" do
          expect do
            click_button "Create"
          end.not_to change(Article, :count)
        end
      end
      
      describe "with valid information" do
        before do
          fill_in "Title",         with: "New Title"
          fill_in "Content",        with: "user@example.com"
        end
  
        it "should create a article" do
          expect do
            click_button "Create"
          end.to change(Article, :count).by(1)
        end
        
  
        
      end
    
    end
  end
end
