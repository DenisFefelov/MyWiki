require 'spec_helper'

describe User do
  #assume that all important functionality is covered by devise gem
  #only additional features will be covered here
  before do
    @user = User.new(username: "Example_User", email: "user@example.com", password: "password", password_confirmation: "password")
  end
  subject { @user }
  
  it { should respond_to(:username) }
  it { should be_valid }
  
  describe "when name is not present" do
    before { @user.username = " " }
    it { should_not be_valid }
  end
  
  describe "when name is incorrect" do
    before { @user.username = 'test$name' }
    it { should_not be_valid }
  end 
  
  describe "when name is correct" do
    before { @user.username = 'TesTT_name.123-2' }
    it { should be_valid }
  end 
  #it { should have_many(:articles) } 
end
