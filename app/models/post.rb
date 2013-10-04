class Post < ActiveRecord::Base
  attr_accessible :status, :user_id, :pictures_attributes
  has_many :pictures, :as => :imageable
  belongs_to :user
  accepts_nested_attributes_for :pictures, :allow_destroy => true
end
