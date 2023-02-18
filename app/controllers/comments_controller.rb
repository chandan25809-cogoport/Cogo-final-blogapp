class CommentsController < ApplicationController
    def create
        @article = Article.find(params[:article_id])
        @comment = @article.comments.build(comment_params)
        if @comment.save
          render json: @comment, status: :created
        else
          render json: { error: @comment.errors.full_messages }, status: :unprocessable_entity
        end
      end
    
      def index
        @article = Article.find(params[:article_id])
        @comments = @article.comments
        render json: @comments, status: :ok
      end
    
      private
    
      def comment_params
        params.require(:comment).permit(:body,:user_name)
      end    
end
