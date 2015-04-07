require 'rails_helper'
RSpec.describe SearchController, type: :controller do
  describe 'GET #search' do
    before(:each) do
      request.env['HTTP_REFERER'] = 'test'
    end
    it 'returns correct search results' do
      a1 = create(:article)
      a2 = create(:article, title: 'Test', plain_body: 'xxxxtestxxxx')
      get :search, query: 'xxxxtestxxxx'
      expect(assigns(:articles)).to match_array([a1, a2])
    end
    it 'redirects to same page if empty query' do
      request.env['HTTP_REFERER']
      get :search, query: ''
      response.should redirect_to 'test'
    end
  end
end
