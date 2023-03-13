class ArticlesController < ApplicationController
  def index
    @articles = Article.all
  end

  def show    
    @article = Article.find(params["id"])
  end

  def new 
    @article = Article.new()
  end

  def create
    # @article = Article.new
    # @article.name = params[:name]
    # @article.body = params[:body]

    @article = Article.new(article_params)
  
    @article.save

    if @article.save
      redirect_to article_path(@article)
    else      
      render :new , status: :unprocessable_entity
    end
  end

  def edit
    @article = Article.find(params["id"])
  end

  def update
    puts 'test'
    @article = Article.find(params["id"])
    if @article.update(article_params) 
      # flash[:notice] = " updated successfully"
      redirect_to article_path(@article)
    else
      # @@isErr = true
      # @@errMsg = @todo.errors.full_messages      
      # redirect_to "/articles/#{params[:id]}/edit"
      render :edit , status: :unprocessable_entity
    end
  end

  def destroy
    @article = Article.find(params["id"])
    @article.destroy
    redirect_to article_path 

  end

  private 

  def article_params
    params.require(:article).permit(:name, :body)  
  end
end
