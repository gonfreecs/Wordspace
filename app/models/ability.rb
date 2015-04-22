# this model is for CanCan abilities. Guests can only view the article. If the logged in user is the writer of the article he/she is viewing, he/she can edit it and if he/she is a moderator, he/she can delete the artcle
# You don't need to be signed in to view Comments or replies. But, you need to be signed in in order to add any of them. Also you can delete or edit them if you wrote them. A moderator can delete any of them.
class Ability
  include CanCan::Ability
  def initialize(user)
    can :show, Article
    can :show, Comment
    can :show, Reply
    unless user.nil?
      can :update, Article do |article|
        article.user_id == user.id
      end
      can :create, Article

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

      if user.is_moderator
        can :destroy, Article
        can :destroy, Comment
        can :destroy, Reply
      end
    end
  end
 end
