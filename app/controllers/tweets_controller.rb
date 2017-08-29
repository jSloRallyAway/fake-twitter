class TweetsController < ApplicationController
	before_action(:find_tweet, only: [:show, :edit, :update, :destroy])
	before_action(:authenticate_user!, except: [:index, :show])
	before_action(:redirect_to_homepage_unless_tweet_belongs_to_current_user, only: [:edit, :update])

	def index 
		@tweets = Tweet.search(params[:query])
	end
	
	def new
		@tweet = Tweet.new
	end
	
	def create
		@tweet = current_user.tweets.create(tweet_params)

		if @tweet.valid?
			redirect_to_tweet('Your tweet was succesfully created!')		
		else
			render(:new)
		end

	end
	
	def update
		@tweet.update(tweet_params)

		if @tweet.valid?
			redirect_to_tweet('Your tweet was succesfully created!')		
		else
			render(:edit)
		end
	end
	
	def destroy
		@tweet.destroy
		redirect_to(tweets_path, notice: 'Your tweet was succesfully deleted!')
	end

	private # anything past this, code that is for the classes own internal use. any public method should respond to an action
	
	def find_tweet
		@tweet = Tweet.find(params[:id])
	end

	def tweet_params
		params[:tweet].permit(:title, :body, :user_id)
	end

	def redirect_to_tweet(message)
		redirect_to(@tweet, notice: message)		
	end

	def redirect_to_homepage_unless_tweet_belongs_to_current_user
		unless @tweet.admin_or_belongs_to?(current_user)
		redirect_to(root_path, notice: 'That is not your tweet')
		end
	end

end
