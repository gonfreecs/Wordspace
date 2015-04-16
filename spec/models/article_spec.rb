# Author: Andrew Magdy
# 9.4.2015
# Magazine Model Tests
require 'rails_helper'
describe Magazine do
  it 'should create a new instance given valid attributes' do
    create(:article)
  end
  before { @invalid = create(:article) }
  context 'blank name' do
    before { @invalid.title = '' }
    it 'validates presence of title' do
      @invalid.should_not be_valid
    end
  end

  # Not working because it has an attached uploader
  # and a seemingly different behaviour
  #
  # context 'blank image' do
  #   before { @invalid = create(:magazine) }
  #   before { @invalid.image = '' }
  #   it 'validates presence of image' do
  #     @invalid.should_not be_valid
  #   end
  # end
end
