class TweetsController < ApplicationController
    def index
        @tweets = Tweet.order(created_at: :DESC)
    end
   
    def new
        if params[:commit] == "もどる"
            @tweet = Tweet.new(tweet_params)
        else
            @tweet = Tweet.new
        end
    end
   
    def create
        @tweet = Tweet.new(tweet_params)
        if @tweet.save
           redirect_to tweets_path, notice: "tweetを作成しました。"
        else 
            render 'new'
        end
    end
    
    def edit
        @tweet = Tweet.find(params[:id])
    end
   
    def update
        @tweet = Tweet.find(params[:id])
        if @tweet.update(tweet_params)
            redirect_to tweets_path, notice: "編集しました。"
        else
            render 'edit'
        end
    end
    
    def destroy
        @tweet = Tweet.find(params[:id])
        @tweet.destroy
        redirect_to tweets_path, notice:"削除しました！"
    end
    
    def confirm
        @tweet = Tweet.new(tweet_params)
        render :new if @tweet.invalid?
    end
   
    def top
       
    end
   
    private
    def tweet_params
        params.require(:tweet).permit(:content)
    end
   
   
end
