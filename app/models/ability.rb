
      # this model is for CanCan abilities. Guests can only view the article.
      # If the logged in user is the writer of the article he/she is viewing,
      # he/she can edit it and if he/she is a moderator,
      # he/she can delete the artcle
      # You don't need to be signed in to view Comments or replies. But,
      # you need to be signed in in order to add any of them.
      #  Also you can delete or edit them if you wrote them.
      # Author: Hariry
      # Date: 2.3.2015
      # Guests can view comments only
      # Author: Hariry
      # Date: 2.3.2015
      # User can add a comment on an article
      # Author: Hariry
      # Date: 2.3.2015
      # User can delete or edit his comment
      # Author: Hariry
      # Date: 31.3.2015
      # Moderators can ban users
      # Author: Hariry
      # Date: 31.3.2015
      # Moderator can view and dismiss reported articles and comments
      # Author: Hariry
      # Date: 29.4.2015
      # User can view his articles controls
      # Author: Mayar
      # Date: 5.4.2015
      # Only managize managers can update magazines
      # Author: Omar Essam
      # Date: 1.4.2015
      # only sponsors can send bid requests
      # Author: Omar Essam
      # Date: 4.4.2015
      # only sponsors can create ads and view sponsors control page
class Ability
  include CanCan::Ability
  def initialize(user)
    can :show, Article
    can :index, Article
    can :show, Comment
    can :show, Reply
    can :show, Magazine

          return if user.nil?
          can :update, Article do |article|
            article.user_id == user.id
          end
          can :follow, User do |other|
            other.id != user.id
          end
          if user.is_banned == 1
            cannot :manage, Article
            cannot :manage, Magazine
            cannot :manage, User
          end
          can :unfollow, User
          can :create, Article
          can :report, Article
          can :create, Magazine
          can :controls, User
          can :update, Comment do |c|
            c.user_id == user.id
          end
          can :destroy, Comment do |co|
            co.user_id == user.id
          end
          can :create, Comment
          can :report, Comment
          can :update, Reply do |r|
            r.user_id == user.id
          end
          can :destroy, Reply do |ro|
            ro.user_id == user.id
          end
          can :create, Reply
          can :update, Magazine do |m|
            (m.users.include? user)
          end
         # 5.4.2015
         # check  promote  if current user
         # and not promoted before
         # and user budget is classified as gold or silver or bronze
         can :promotion, Article do |article|
           article.promoted == false
           article.user_id == user.id
         end
          can :promotion_gold, Article do |article|
           article.user_id == user.id
           user.budget > 4_000_000
         end
         can :promotion_silver, Article do |article|
           article.user_id == user.id
           user.budget > 40_000
         end
         can :promotion_bronze, Article do |article|
           article.user_id == user.id
           user.budget > 4000
         end
          if user.is_moderator
            can :destroy, Article
            can :destroy, Comment
            can :destroy, Reply
            can :index, :sponsor
            can :destroy, Magazine
              can :reports, User
              can :banned_users, User
              can :ban, User
              can :unban, User
              can :dismiss_article, User
              can :dismiss_comment, User
          end
          return unless user.is_sponsor
          can :create, Bid
          can :show, :sponsor
          can :control, :sponsor
          can :destroy, Bid do|b|
            b.user_id == User.id
          end
          can :create, Ad
          can :bid, Article do|a|
            !a.is_sponsored && Bid
              .where(user_id:  user.id, article_id: a.id) == []
          end
        end
      end
