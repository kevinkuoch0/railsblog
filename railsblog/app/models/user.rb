class User < ActiveRecord::Base
	has_many :comments
	has_many :posts
	has_many :friendships
	has_many :friends, :through => :friendships, foreign_key: :user_id
end
