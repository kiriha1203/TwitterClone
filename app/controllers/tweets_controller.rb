class TweetsController < ApplicationController
  def index
    @tweets = Tweet.all.order(updated_at: "DESC")
  end

  def new
    @tweet =Tweet.new
  end

  def create
    tweet = Tweet.new(tweet_params)
    tweet.save
    redirect_to tweets_url, notice: "「#{tweet.content}をツイートしました。」"
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

  def tweet_params
    params.require(:tweet).permit(:content)
  end
end
