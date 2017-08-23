module TweetsHelper # only diff between this and a Class is that you can't create instances of this (can't call ".new" on)

# HELPERS ARE FOR METHODS THAT WILL BE USED IN MANY PLACES

	def edit_tweet_link(tweet)
		link_to('Edit', edit_tweet_path(tweet))
	end

	def delete_tweet_link(tweet)
		link_to('Delete', tweet, method: :delete, data: {confirm: 'Are you sure?'})	
	end
end
