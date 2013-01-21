class HistoriesController < ApplicationController
  def index
    @article = Article.find(params[:article_id])
    @histories = @article.histories

    respond_to do |format|
      format.html
    end
  end

  def show
    @history = History.find(params[:id])
    @diff = Diffy::Diff.new( @history.old_content || "", 
                             @history.new_content || "", 
                             :diff=>"-U 10000", :source=>"strings", :include_diff_info=>true).to_s(:text)

    respond_to do |format|
      format.html
    end
  end
end
