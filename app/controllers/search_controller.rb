# Author: Mohammed El-Ansary
# 1.4.2015
# Controller responsible for searching for articles
class SearchController < ApplicationController
  def search
    @query_str = ActionView::Base.full_sanitizer.sanitize(params[:query])
    if @query_str.length > 0
      @query_string = '%' << @query_str.gsub('_', '\\_').gsub('%', '\\%') << '%'
      @articles = Article.where('(title LIKE ?) OR (plain_body LIKE ?)',
                                @query_string, @query_string)
      @magazines = Magazine.where('(name LIKE ?)', @query_string)
      @users = User.where('(firstname LIKE ?) OR (lastname LIKE ?)',
                          @query_string, @query_string)
    else
      redirect_to(:back)
    end
  end

  private

  # Never trust parameters from the scary internet
  def search_params
    params.permit(:query)
  end
end
