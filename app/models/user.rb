class User < ActiveRecord::Base
  has_many :friendlists, :dependent => :destroy
  has_many :friends, :through => :friendlists, :conditions => "friend_staus = 'accepted'"
  has_many :pictures, :as => :imageable
  has_many :myfriend, :through => :friends, :source => "Friend"
  has_many :posts
  has_many :comments
  has_many :ratings
  
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :first_name, :last_name, :date_of_birth, 
    :contact, :hobby, :home_town, :state, :country, :relationship_status, :interest_in, :language, :religion, :gender,
    :pictures_attributes

  accepts_nested_attributes_for :pictures, :allow_destroy => true

  # attr_accessible :title, :body
end
