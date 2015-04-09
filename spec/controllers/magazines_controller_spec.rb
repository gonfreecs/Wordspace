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
end
