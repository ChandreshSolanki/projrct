class Picture < ActiveRecord::Base
 
  attr_accessible :image, :imageable_id, :imageable_type, :user_id
  belongs_to :imageable, :polymorphic => true
  belongs_to :user
  #belongs_to :post
  mount_uploader :image, ImageUploader
end
