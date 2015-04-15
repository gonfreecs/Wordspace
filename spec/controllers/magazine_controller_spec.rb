require 'rails_helper'
RSpec.describe MagazinesController, type: :controller do
  describe 'GET #showrequests' do
    before(:each) do
      request.env['HTTP_REFERER'] = 'test'
    end
    it 'renders the showrequests template' do
      get :showrequests
      expect(response).to render_template('showrequests')
    end

    it 'responds successfully with an HTTP 200 status code' do
      get :showrequests
      expect(response).to be_success
      expect(response).to have_http_status(200)
    end

    it 'shows joining requests correctly' do
      r1 = create(:requestjoiningmagazine)
      r2 = create(:article, title: 'Test', plain_body: 'xxxxtestxxxx')
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
