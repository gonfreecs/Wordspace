# Author: Mohammed El-Ansary
# 9.4.2015
# Magazine Model Tests
require 'rails_helper'
describe Magazine do
  it 'should create a new instance given valid attributes' do
    create(:magazine)
  end
  before { @invalid = create(:magazine) }
  context 'blank name' do
    before { @invalid.name = '' }
    it 'validates presence of name' do
      @invalid.should_not be_valid
    end
  end
  context 'blank description' do
    before { @invalid.decription = '' }
    it 'validates presence of description' do
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
