class User < ActiveRecord::Base
  has_and_belongs_to_many :friends
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :first_name, :last_name, :date_of_birth, :contact, :hobby, :home_town, :state, :country, :relationship_status, :interest_in, :language, :religion, :gender
  # attr_accessible :title, :body
end
