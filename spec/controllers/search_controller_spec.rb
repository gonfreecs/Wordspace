# Author: Mohammed El-Ansary
# 7.4.2015
# Search Controller Tests
require 'rails_helper'
RSpec.describe SearchController, type: :controller do
  describe 'GET #search' do
    before(:each) do
      request.env['HTTP_REFERER'] = 'test'
    end
    it 'filters wildcards before search' do
      create(:article)
      get :search, query: '_'
      expect(assigns(:articles)).to match_array([])
      get :search, query: '%'
      expect(assigns(:articles)).to match_array([])
    end
    it 'returns correct search results' do
      a1 = create(:article)
      a2 = create(:article, title: 'Text', plain_body: 'xxxxtestxxxx')
      create(:article, title: 'Mohammed', plain_body: 'Ansary')
      m1 = create(:magazine, name: 'xxxxtestxxxx')
      create(:magazine, name: 'magazine')
      u1 = create(:user, firstname: 'xxxxtestxxxx')
      get :search, query: 'xxxxtestxxxx'
      expect(assigns(:articles)).to match_array([a1, a2])
      expect(assigns(:magazines)).to match_array([m1])
      expect(assigns(:users)).to match_array([u1])
    end
    it 'redirects to same page if empty query' do
      request.env['HTTP_REFERER']
      get :search, query: ''
      response.should redirect_to 'test'
    end
  end
end
