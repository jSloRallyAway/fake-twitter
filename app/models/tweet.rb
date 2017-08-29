class Tweet < ActiveRecord::Base
	belongs_to(:user)
	validates(:title, presence: {message: 'must be entered.'})
	validates(:body, presence: {message: 'must be entered.'}, length: {maximum: 140})

	def admin_or_belongs_to?(user)
		user.try(:admin?) || self.user == user
	end

	def self.search(query)
		query = "%#query}%"
		where("title LIKE ? OR body LIKE ?", query, query)
	end

end
