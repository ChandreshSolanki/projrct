class Post < ActiveRecord::Base
  attr_accessible :status, :user_id, :pictures_attributes, :ratings_attribute
  has_many :pictures, :as => :imageable
  has_many :ratings, :as => :ratingable
  has_many :comments, :dependent => :destroy
  belongs_to :user
  accepts_nested_attributes_for :pictures, :allow_destroy => true
end
