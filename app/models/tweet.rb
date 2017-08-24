class Tweet < ActiveRecord::Base
	belongs_to(:user)
	validates(:title, presence: {message: 'must be entered.'})
	validates(:body, presence: {message: 'must be entered.'}, length: {maximum: 140})
end
