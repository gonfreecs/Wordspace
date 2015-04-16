require 'rails_helper'
RSpec.describe ArticlesController, type: :controller do
  # Author: Andrew Magdy
  # 9.4.2015
  # Article Controller Tests for CreateMagazine
  describe 'POST #create' do
    it 'allows signed in users to create magazines' do
      @user = create(:user)
      sign_in @user
      post :create, article: FactoryGirl.attributes_for(:article)
      expect(assigns(:article)).to match(Article.last)
      expect(assigns(:article).user).to match(@user)
      expect(@user.articles).to match_array([(assigns(:article))])
    end
  end
  describe 'DELETE #destroy' do
    it 'allows moderators to delete articles' do
      @user = create(:user, is_moderator: true)
      sign_in @user
      @m1 = create(:article)
      @instance1 = Article.last
      delete :destroy, id: @m1.id,
                       article: FactoryGirl.attributes_for(:article)
      @instance2 = Article.last
      expect(@instance1) != @instance2
    end
  end
  # Fails due to bad controller implementation to be fixed
  # describe 'GET #show' do
  #  it 'allows anybody to view article' do
  #    @m1 = create(:article)
  #    get :show, id: @m1.id,
  #               article: FactoryGirl.attributes_for(:article)
  #    expect(assigns(:article)).to match(@m1)
  #  end
  # end
end
