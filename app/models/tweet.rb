class Tweet < ActiveRecord::Base
	belongs_to(:user)
	validates(:title, presence: {message: 'must be entered.'})
	validates(:body, presence: {message: 'must be entered.'}, length: {maximum: 140})

	def admin_or_belongs_to?(user)
		user.try(:admin?) || self.user == user
	end

	def self.search(query)
		query = "%#{query}%"
		where("title LIKE ? OR body LIKE ?", query, query)
	end

  has_attached_file(:image, 
  					styles: {thumbnail: "100x100>", 
  							 full: "300x300>" })
  validates_attachment_content_type(:image, content_type: /\Aimage\/.*\z/)

end
