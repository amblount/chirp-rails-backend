class TweetsController < ApplicationController
  
    # before_action :authenticate, except: [:login]

    def index
        render :json => Tweet.all, status: 200
    end

    def create
        # tweet = Tweet.create(tweet_params)
        tweet = Bird.find(params[:bird_id]).tweets.create(tweet_params)

        if tweet.valid?
            render :json => tweet, status: 201
        else
            render :json => {error: "tweet validation failed"}, status: 400
        end
    end

    def edit
        tweet = Tweet.find(params[:id])

        render :json => tweet, status: 200
    end

    def update
        tweet = Tweet
            .find(params[:id])
            .update_attributes(tweet_params)

        if tweet
            render :json => {success: "tweet updated successfully"}, status: 204
        else
            render :json => {error: "Failed to update tweet"}, status: 400
        end
    end

    def destroy
        tweet = Tweet.find(params[:id])

        tweet.destroy

        if tweet.destroyed?
            render :json => {success: "tweet destroyed successfully"}, status: 200
        else
            render :json => {error: "Error removing tweet"}, status: 400
        end
    end

    # def login
    #     tweet = Tweet.find_by(email: params[:email])

    #     if tweet
    #         if tweet.authenticate(params[:password])
    #             render :json => tweet, status: 200
    #         else
    #             head 401
    #         end
    #     else
    #         render :json => {error: "tweet not found"}, status: 404
    #     end
    # end

private

    def tweet_params
        params.require(:tweet).permit(:content)
    end
end
