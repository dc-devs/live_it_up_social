class User < ActiveRecord::Base
has_secure_password
validates_presence_of :password, :on => :create
has_many :votes
has_many :activities
end
