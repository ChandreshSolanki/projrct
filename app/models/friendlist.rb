class Friendlist < ActiveRecord::Base
  attr_accessible :friend_id, :friend_staus, :user_id
  belongs_to :user
  belongs_to :friend, :class_name => 'User', :foreign_key =>'friend_id'
end
