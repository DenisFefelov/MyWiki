class ArticlesController < ApplicationController
  before_filter :authenticate_user!, :except => [:show, :index]
  before_filter :get_old_content, :only => [:create, :update]

  
  # GET /articles
  # GET /articles.json
  def index
    @articles = Article.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @articles }
    end
  end

  # GET /articles/1
  # GET /articles/1.json
  def show
    @article = Article.find(params[:id])
    if request.path != article_path(@article)
      redirect_to @article, status: :moved_permanently
    end
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @article }
    end
  end

  # GET /articles/new
  # GET /articles/new.json
  def new
    @article = Article.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @article }
    end
  end

  # GET /articles/1/edit
  def edit
    @article = Article.find(params[:id])
  end

  # POST /articles
  # POST /articles.json
  def create
   @article = current_user.last_edited_articles.build(params[:article])
   respond_to do |format|
      if @article.save
        @article.save_history(current_user, @old_content)
        format.html { redirect_to @article, notice: 'Article was successfully created.' }
        format.json { render json: @article, status: :created, location: @article }
      else
        format.html { render action: "new" }
        format.json { render json: @article.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /articles/1
  # PUT /articles/1.json
  def update
    respond_to do |format|
      if @article.update_attributes(params[:article])
        @article.save_history(current_user, @old_content)
        format.html { redirect_to @article, notice: 'Article was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @article.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /articles/1
  # DELETE /articles/1.json
  def destroy
    @article = Article.find(params[:id])
    @article.destroy

    respond_to do |format|
      format.html { redirect_to articles_url }
      format.json { head :no_content }
    end
  end
  
  private
  
      def get_old_content
        if request.put? && params[:id]
          @article = Article.find(params[:id])
          @old_content = @article.content
        else
          @old_content = ""  
        end
        
      end

end
