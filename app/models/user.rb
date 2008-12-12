class User < ActiveRecord::Base
   validates_presence_of :login, :password
  validates_length_of :password, :within => 3..20
  validates_uniqueness_of :login
  
  has_many :posts
end
