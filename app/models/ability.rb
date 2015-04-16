
# this model is for CanCan abilities. Guests can only view the article. If the logged in user is the writer of the article he/she is viewing, he/she can edit it and if he/she is a moderator, he/she can delete the artcle
# You don't need to be signed in to view Comments or replies. But, you need to be signed in in order to add any of them. Also you can delete or edit them if you wrote them. A moderator can delete any of them.
class Ability
  include CanCan::Ability

  def initialize(user)
    can :show, Article
    can :index, Article
    can :show, Comment
    can :show, Reply
    can :show, Magazine
    unless user.nil?
      can :update, Article do |article|
        article.user_id == user.id
      end
      can :create, Article
      can :create, Magazine
      can :update, Comment do |c|
        c.user_id == user.id
      end
      can :destroy, Comment do |co|
        co.user_id == user.id
      end
      can :create, Comment

      can :update, Comment do |c|
        c.user_id == user.id
      end
      # mohab
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

      # Author: Mayar
      # Date: 5.4.2015
      # Only managize managers can update magazines
      can :update, Magazine do |m|
        (m.users.include? user)
      end

      if user.is_moderator
        can :destroy, Article
        can :destroy, Comment
        can :destroy, Reply
        can :destroy, Magazine
      end
    end
  end
end
