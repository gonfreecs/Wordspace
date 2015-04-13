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

end
