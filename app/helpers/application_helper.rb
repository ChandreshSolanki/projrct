module ApplicationHelper
  def rating_like
    @rating = Rating.where(:like => true).first
  end
  
  def rating_dislike
    @rating = Rating.where(:like => false).first
  end

end
