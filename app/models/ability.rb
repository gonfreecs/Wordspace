      # this model is for CanCan abilities. Guests can only view the article.
      # If the logged in user is the writer of the article he/she is viewing,
      # he/she can edit it and if he/she is a moderator,
      # he/she can delete the artcle
      # You don't need to be signed in to view Comments or replies. But,
      # you need to be signed in in order to add any of them.
      #  Also you can delete or edit them if you wrote them.
      # A moderator can delete any of them.
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
          can :unfollow, User
          can :create, Article
          can :create, Magazine
          can :update, Comment do |c|
            c.user_id == user.id
          end
          can :destroy, Comment do |co|
            co.user_id == user.id
          end
          can :create, Comment
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
          if user.is_moderator
            can :destroy, Article
            can :destroy, Comment
            can :destroy, Reply
            can :index, :sponsor
            can :destroy, Magazine
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
