module ApplicationHelper
 
  def commentpost_like(id)
  
    Rating.where(:user_id => current_user.id, :ratingable_id => id).first 
  end
  
end
