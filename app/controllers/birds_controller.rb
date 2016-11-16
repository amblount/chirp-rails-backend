class BirdsController < ApplicationController
  
    # before_action :authenticate, except: [:login]

    def index
        render :json => Bird.all, status: 200
    end

    def create
        bird = Bird.create(bird_params)

        if bird.valid?
            render :json => bird, status: 201
        else
            render :json => {error: "bird validation failed"}, status: 400
        end
    end

    def edit
        bird = Bird.find(params[:id])

        render :json => bird, status: 200
    end

    def update
        bird = Bird
            .find(params[:id])
            .update_attributes(bird_params)

        if bird
            render :json => {success: "bird updated successfully"}, status: 204
        else
            render :json => {error: "Failed to update bird"}, status: 400
        end
    end

    def destroy
        bird = Bird.find(params[:id])

        bird.destroy

        if bird.destroyed?
            render :json => {success: "bird destroyed successfully"}, status: 200
        else
            render :json => {error: "Error removing bird"}, status: 400
        end
    end

    # def login
    #     bird = Bird.find_by(email: params[:email])

    #     if bird
    #         if bird.authenticate(params[:password])
    #             render :json => bird, status: 200
    #         else
    #             head 401
    #         end
    #     else
    #         render :json => {error: "bird not found"}, status: 404
    #     end
    # end

private

    def bird_params
        params.require(:bird).permit(:name)
    end
end
