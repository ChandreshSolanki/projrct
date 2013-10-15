module ApplicationHelper
 
  def comment_like(userid, id)
    Rating.where(:user_id => userid, :ratingable_id => id, :like=>true )
  end
  
  def post_like(userid, id)
    
  end
end
