# mohab
# 3.4.2015
# article model test
require 'rails_helper'
describe Article do
  it 'has a valid factory' do
    FactoryGirl.create(:article).should be_valid
  end
  it 'is invalid without a tags' do
    FactoryGirl.build(:article, tag_list: nil).should_not be_valid
  end
end
