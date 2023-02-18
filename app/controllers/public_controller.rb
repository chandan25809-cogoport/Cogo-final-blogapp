class PublicController < ApplicationController
    def articleindex
        articles = Article.joins(:user).select('articles.*, users.name as username')
        render json: articles
    end

    def find_article_by_username
        user=User.find_by(name:params[:id])
        render json: {user:user,articles:user.articles.all}
    end
end
