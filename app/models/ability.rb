class Ability
  include CanCan::Ability
 def initialize(user)
 	can :show, Article
 	if user != nil
 		can :update, Article do |article|
 			 article.user_id == user.id
 		end
		can :create, Article
		if user.is_moderator
			can :destroy, Article
		end
 	end












 end
 end
