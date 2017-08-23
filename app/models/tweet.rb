class Tweet < ActiveRecord::Base
	# validates_presence_of(:title, message: 'must be entered.')
	# validates_presence_of(:body, message: 'must be entered.')
	validates(:title,
			  presence: {message: 'must be entered.'})
	validates(:body,
			  presence: {message: 'must be entered.'},
			  length: {maximum: 140})
end
