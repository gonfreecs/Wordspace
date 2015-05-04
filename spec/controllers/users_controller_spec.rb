require 'rails_helper'
RSpec.describe UsersController, type: :controller do
  # Author: Mayar
  # Date: 30.4.2015
  # checking mymagazines action
  describe 'GET #mymagazines' do
    it 'allows signed in user to get the magazines he is managing' do
      @user = create(:user)
      sign_in @user
      @magazine = create(:magazine)
      @magazine.users << @user
      get :mymagazines, magazines: FactoryGirl.attributes_for(:user)
      expect(assigns(:magazines)).to match_array([@magazine])
    end
  end

  # Author: Hariry
  # 29.4.2015
  # Test for user to view all his articles
  describe 'GET #controls' do
    it 'allows logged user to view all his articles' do
      @user = create(:user)
      sign_in @user
      @article = create(:article, user_id: @user.id)
      get :controls, user: FactoryGirl.attributes_for(:user)
      expect(assigns(:my_articles)).to match_array([@article])
    end
  end
  # Author: Hariry
  # 29.4.2015
  # Test for user to view promoted articles
  describe 'GET #controls' do
    it 'allows logged user to view his promoted articles' do
      @user = create(:user)
      sign_in @user
      @article = create(:article, user_id: @user.id, promotevalue: 1_000_000)
      @article2 = create(:article, user_id: @user.id, promotevalue: 2_000_000)
      @article3 = create(:article, user_id: @user.id, promotevalue: 3_000_000)
      get :controls, user: FactoryGirl.attributes_for(:user)
      expect(assigns(:promoted_articles_1000)).to match_array([@article])
      expect(assigns(:promoted_articles_2000)).to match_array([@article2])
      expect(assigns(:promoted_articles_3000)).to match_array([@article3])
    end
  end
  # Author: Hariry
  # 29.4.2015
  # Test for user to view sponsered articles
  describe 'GET #controls' do
    it 'allows logged user to view his sponsered articles' do
      @user = create(:user)
      sign_in @user
      @article = create(:article, user_id: @user.id, is_sponsored: true)
      get :controls, user: FactoryGirl.attributes_for(:user)
      expect(assigns(:sponsered_articles)).to match_array([@article])
    end
  end
end
