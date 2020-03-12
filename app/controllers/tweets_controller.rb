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
    @tweet = Tweet.find(params[:id])
  end

  def update
    tweet = Tweet.find(params[:id])
    tweet.update!(tweet_params)
    redirect_to tweets_url, notice: "「#{tweet.created_at}のツイートを更新しました。」"
  end

  def destroy
    tweet = Tweet.find(params[:id])
    tweet.destroy
    redirect_to tweets_url, notice: "「#{tweet.created_at}のツイートを削除しました。」"
  end

  private

  def tweet_params
    params.require(:tweet).permit(:content)
  end
end
