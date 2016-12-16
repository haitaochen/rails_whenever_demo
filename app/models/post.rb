class Post < ActiveRecord::Base
	def self.shanchu
		id = Post.first.id
		Post.delete(id)
	end
end
