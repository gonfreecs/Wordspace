require 'rails_helper'
require 'capybara/rails'
RSpec.describe ArticlesController, type: :controller do
  # Author: Andrew Magdy
  # 9.4.2015
  # Article Controller Tests for CreateArticle
  describe 'POST #create' do
    it 'allows signed in users to create articles' do
      @user = create(:user)
      sign_in @user
      post :create, article: FactoryGirl.attributes_for(:article)
      expect(assigns(:article)).to match(Article.last)
      expect(assigns(:article).user).to match(@user)
      expect(@user.articles).to match_array([(assigns(:article))])
    end
  end
  describe 'DELETE #destroy' do
    it 'allows moderators to delete articles' do
      @user = create(:user, is_moderator: true)
      sign_in @user
      @m1 = create(:article)
      @instance1 = Article.last
      delete :destroy, id: @m1.id,
                       article: FactoryGirl.attributes_for(:article)
      @instance2 = Article.last
      expect(@instance1) != @instance2
    end
  end



  describe "Categories", :type => :feature do
        before :each do
          @m1 = create(:article,category_list: 'Cat1,Cat2')
        end

        it "views category" do
          visit '/categories/Cat1'
          save_and_open_page
          expect(page).to have_link("Show", :href => article_path(@m1))
        end
   end

   describe "Tags", :type => :feature do
         before :each do
           @m1 = create(:article,tag_list: 'Cat1,Cat2')
         end

         it "views tag" do
           visit '/tags/Cat1'
           save_and_open_page
           expect(page).to have_link("Show", :href => article_path(@m1))
         end
    end

end
