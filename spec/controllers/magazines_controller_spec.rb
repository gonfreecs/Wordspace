require 'rails_helper'
RSpec.describe MagazinesController, type: :controller do
  # Author: Mohammed El-Ansary
  # 9.4.2015
  # Magazine Controller Tests for CreateMagazine
  describe 'POST #create' do
    it 'allows signed in users to create magazines' do
      @user = create(:user)
      sign_in @user
      post :create, magazine: FactoryGirl.attributes_for(:magazine)
      expect(assigns(:magazine)).to match(Magazine.last)
      expect(assigns(:magazine).users).to match_array([@user])
      expect(@user.magazines).to match_array([(assigns(:magazine))])
    end
  end
  describe 'DELETE #destroy' do
    it 'allows moderators to delete magazines' do
      @user = create(:user, is_moderator: true)
      sign_in @user
      @m1 = create(:magazine)
      @instance1 = Magazine.last
      delete :destroy, id: @m1.id,
                       magazine: FactoryGirl.attributes_for(:magazine)
      @instance2 = Magazine.last
      expect(@instance1) != @instance2
    end
  end
  describe 'GET #show' do
    it 'allows anybody to view magazines' do
      @m1 = create(:magazine)
      get :show, id: @m1.id,
                 magazine: FactoryGirl.attributes_for(:magazine)
      expect(assigns(:magazine)).to match(@m1)
    end
  end

    # Authou: Bassem
    # 11/4/2015
    # testing the method follow using rspec
  describe 'GET #follow' do
    it 'allows signed in users to follow magazines' do
      request.env['HTTP_REFERER'] = 'test'
      @user = create(:user)
      sign_in @user
      request.env['HTTP_REFERER']
      @m1 = create(:magazine)
      @instance1 = Magazine.last
      get :follow, id: @m1.id,
                   magazine: FactoryGirl.attributes_for(:magazine)
      #expect(@instance1.followers_count).to eq(1)
      response.should redirect_to 'test'
    end
  end

  # Authou: Bassem
  # 11/4/2015
  # testing the method unfollow using rspec
  describe 'GET #unfollow' do
    it 'allows signed in users to follow magazines' do
      request.env['HTTP_REFERER'] = 'test'
      @user = create(:user)
      sign_in @user
      request.env['HTTP_REFERER']
      @m1 = create(:magazine)
      @instance1 = Magazine.last
      get :unfollow, id: @m1.id,
                   magazine: FactoryGirl.attributes_for(:magazine)
      #expect(@instance1.followers_count).to eq(1)
      response.should redirect_to 'test'
    end
  end


end
