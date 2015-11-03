class User < ActiveRecord::Base
	has_many :comments
	has_many :posts
	has_many :follows, foreign_key: :follower_id

	def following?(other_user)
		followers = follows.collect {|f| f.followee_id}
		followers.include?(other_user.id)
	end
end
