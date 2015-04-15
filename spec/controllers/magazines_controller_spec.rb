require 'rails_helper'
RSpec.describe MagazinesController, type: :controller do
  # Author: Mayar
  # 8.4.2015
  # Magazine Controller Tests for managesMagazine
  describe 'PUT #update' do
    it 'updates maagzine info correctly' do
      @magazine = create(:magazine)
      @user = create(:user)
      sign_in @user
      @magazine.users << @user
      put :update, id: @magazine.id,
                   magazine: FactoryGirl.attributes_for(:magazine,
                                                        name: 'test')
      @magazine.reload
      @magazine.name.should == 'test'
    end
  end

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
end
