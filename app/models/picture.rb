class Picture < ActiveRecord::Base
 
  attr_accessible :image, :imageable_id, :imageable_type, :user_id
  belongs_to :imageable, :polymorphic => true
  belongs_to :user
  mount_uploader :image, ImageUploader
  
end
