class TweetsController < ApplicationController
  before_action :set_tweet, only: [:edit, :update]

  def index
    @tweets = Tweet.all.order(updated_at: "DESC")
  end

  def new
    @tweet = Tweet.new
  end

  def create
    @tweet = Tweet.new(tweet_params)
    if params[:back]
      render :new
    else
      if @tweet.save
        redirect_to tweets_url, notice: "「#{@tweet.content}をツイートしました。」"
      else
        render :new
      end
    end
  end

  def confirm
    @tweet = Tweet.new(tweet_params)
    render :new if @tweet.invalid?
  end

  def edit
  end

  def update
    if @tweet.update(tweet_params)
      redirect_to tweets_url, notice: "「#{@tweet.created_at}のツイートを更新しました。」"
    else
      render :edit
    end
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

  def set_tweet
    @tweet = Tweet.find(params[:id])
  end
end
