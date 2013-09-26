class Friend < ActiveRecord::Base
  attr_accessible :friend_id, :friend_status, :user_id
  has_and_belongs_to_many :users ,:class_name => 'User', :foreign_key => 'friend_id'
