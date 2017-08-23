class TweetsController < ApplicationController
	before_action(:find_tweet, only: [:show, :edit, :update, :destroy])
	before_action :authenticate_user!

	def index # action needs to tie to one of the routes
		@tweets = Tweet.all # you can call the instance variable ('@x') whatever you want
	end
	
	def new
		@tweet = Tweet.new
	end
	
	def create
		@tweet = Tweet.create(tweet_params)

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
		params[:tweet].permit(:title, :body)
	end

	def redirect_to_tweet(message)
		redirect_to(@tweet, notice: message)		
	end

end
