# Author: Mayar
# 12.4.2015
# Test for add article to magazine
require 'rails_helper'
RSpec.describe ArticlesController, type: :controller do
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
  describe 'PUT #update/homepagelist' do
    it 'curator can add article to homepagelist' do
      @user = create(:user, :curator => true)
      sign_in @user
      @article = create(:article, :user_id  => @user.id)
      put :update, id: @article.id,
                   article: FactoryGirl.attributes_for(:article,
                                                       homepagelist:
                                                      'true')
      @article.reload
      expect(assigns(:article).homepagelist).to match(true)
    end
  end
  it 'curator can remove article to homepagelist' do
    @user = create(:user, :curator => true)
    sign_in @user
    @article = create(:article, :user_id  => @user.id,
                     :homepagelist => true )
    put :update, id: @article.id,
                 article: FactoryGirl.attributes_for(:article,
                                                     homepagelist:
                                                    'false')
    @article.reload
    expect(assigns(:article).homepagelist).to match(false)
  end
end
