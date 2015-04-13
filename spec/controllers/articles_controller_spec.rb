<<<<<<< HEAD
require 'rails_helper'
RSpec.describe SearchController, type: :controller do


  # Author: Bassem
  # 9/4/2015
  # testing upvote method

  describe 'GET #upvote' do
    it 'allows signed in users to like articles' do
      @user = create(:user)
      sign_in @user
      @a1 = create(:article)
      get :upvote, id: @a1.id, article: FactoryGirl.attributes_for(:article)
      expect(response).to redirect_to(@a1)
    end
  end

  # Author: Bassem
  # 9/4/2015
  # testing upvote method

  describe 'GET #downvote' do
    it 'allows signed in users to like articles' do
      @user = create(:user)
      sign_in @user
      @a1 = create(:article)
      get :downvote, id: @a1.id, article: FactoryGirl.attributes_for(:article)
      expect(response).to redirect_to(@a1)

    end
  end

=======
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
>>>>>>> ecee245503362cc428fc50fb9b1eeef0823cbac6
end
