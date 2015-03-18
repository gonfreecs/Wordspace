class ArticlesController < ApplicationController
#loading all variables
load_and_authorize_resource
#rescre from invalid articles ids
rescue_from(ActiveRecord::RecordNotFound) {
    raise(CanCan::AccessDenied, 'Article is not found')
  }
  def new
  end

  def index
  end

  def show
  @user=User.find(@article.user_id)
  

  end

  def create
  end

  def update
  end

  def destroy	
  @article.destroy
  end

  def edit
  end
  #This is to allow access to certain article parameters(title,bod, writerID,timin,id,image)
  def article_params
   params.require(:article).permit(:title, :body, :user_id, :timing, :id, :image)
    end
end
