require 'rails_helper'
RSpec.describe MagazinesController, type: :controller do
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
end
