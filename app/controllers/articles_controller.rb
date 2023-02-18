class ArticlesController <ApiController
    before_action :set_article, only: [ :update, :destroy]
    def index
        # @companies = Company.all
        @articles = current_user.articles
        render json: @articles, status: :ok
      end
    
      def show
        render json: Article.all, status: :ok
      end

      def userarticles
        render json: {user:current_user ,articles:current_user.articles.all}
      end

      def articlebyid
        render json:Article.find(params[:id])
      end

    def create
        @article=Article.new(article_params)
        if @article.save
            render json:@article,status: :ok
        else
            render json: { data: @article.errors.full_messages, status: "failed" }, status: :unprocessable_entity
          end  
    end

    def update
        if @article.update(article_params)
          render json: @article, status: :ok
        else
          render json: { data: @article.errors.full_messages, status: "failed" }, status: :unprocessable_entity
        end  
      end
      def destroy
        @article = Article.destroy(params[:id])
        if @article
            render json: { message: "deleted successfully" }, status: :ok
        else
            render json: { data: @article.errors.full_messages, status: "failed" }, status: :unprocessable_entity
        end
    end
    private 
    def set_article
        # @company = Company.find(params[:id])
        @article = current_user.articles.find(params[:id])
      rescue ActiveRecord::RecordNotFound => error
        render json: error.message, status: :unauthorized
      end
    def article_params 
        params.require(:article).permit(:body,:article_name,:category_id,:user_id,:image,:likes)
    end
    
end
