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
    @diff = Diffy::Diff.new(@history.old_content ? @history.old_content : "", 
                            @history.new_content ? @history.new_content : "", 
                            :include_plus_and_minus_in_html => true).to_s(:html_simple)

    respond_to do |format|
      format.html
    end
  end
end
