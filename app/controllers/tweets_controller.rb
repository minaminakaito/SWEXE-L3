class TweetsController < ApplicationController
  def index
    @tweets = Tweet.all
  end
  def new
    @tweet = Tweet.new
  end
  def create
    @tweet = Tweet.new(message: params[:tweet][:message], tdate: Time.current)
    if @tweet.save
      flash[:notice] = '1レコード追加しました'
      redirect_to '/'
    else
      render 'new'
    end
  end
  def destroy
    tweet = Tweet.find(params[:id])
    tweet.destroy
    redirect_to '/'
  end
  def edit
    @tweet = Tweet.find(params[:id])
  end
  def update
    tweet = Tweet.find(params[:id])
    tweet.update(message: params[:tweet][:message],tdate: params[:tweet][:tdate])
    redirect_to '/'
  end
  def show
    @tweet = Tweet.find(params[:id])
  end
end
