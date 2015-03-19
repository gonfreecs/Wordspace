#this model is for CanCan abilities. Guests can only view the article. If the logged in user is the writer of the article he/she is viewing, he/she can edit it and if he/she is a moderator, he/she can delete the artcle
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
  
