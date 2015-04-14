# Author: Mayar
# 12.4.2015
# Test for add article to magazine
require 'rails_helper'
RSpec.describe ArticlesController, type: :controller do
  describe 'PUT #update with promotion value' do
    it 'article promoted' do
      @article = create(:article)
      @user = create(:user)
      sign_in @user
     @article.user = @user
      put :update, id: @article.id,
                   article: FactoryGirl.attributes_for(:article,
                                                        promoted: true,
                                                        promotevalue: 2000000)
      @article.reload
      @article.promoted.should == true
    end
  end
  describe 'POST #create' do
    it 'allows signed in users to create articles on their magazines' do
      @user = create(:user)
      sign_in @user
      @magazine = create(:magazine)
      post :create, article: FactoryGirl.attributes_for(:article,
                                                        magazine_id:
                                                        @magazine.id)
      expect(assigns(:article)).to match(Article.last)
      expect(assigns(:article).user_id).to match(@user.id)
      expect(assigns(:article).magazine_id).to match(@magazine.id)
    end
  end
end
