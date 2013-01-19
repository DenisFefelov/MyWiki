require 'spec_helper'

describe Article do
  before do
    @article = Article.new(title: "Example Article", content: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Mauris scelerisque magna eu arcu imperdiet id consectetur nunc porttitor. Praesent ultricies")
  end
  subject { @article }
  
  it { should respond_to(:title) }
  it { should respond_to(:content) }
  it { should respond_to(:last_editor_id) }
  it { should respond_to(:last_edited_at) }
  
  describe "when content is not present" do
    before { @article.content = " " }
    it { should_not be_valid }
  end
  
  describe "when title is not present" do
    before { @article.title = " " }
    it { should_not be_valid }
  end
end
