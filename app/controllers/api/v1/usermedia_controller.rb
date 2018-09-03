class Api::V1::UsermediaController < ApplicationController
    skip_before_action :authenticate_request, only: [:login, :create]
    before_action :find_user_media, only: [:update]

    def index
        @user_media = UserMedia.all
        render json: @user_media
    end

    def update
        @user_medium.update(user_media_params)
        if @user_medium.save
            render json: @user_medium, status: :accepted
        else
            render json: {errors: @user_medium.errors.full_messages}, status: :unprocessible_entity
        end
    end

    def create
        @user_medium.find_or_create_by(user_media_params)
        if @user_medium.save
            render json: @user_medium, status: :accepted
        else
            render json: {errors: @user_medium.errors.full_messages}, status: :unprocessible_entity
        end
    end

    def destroy
        @user_medium.delete
    end

    private

    def user_medium_params
        params.permit(:user_id, :medium_id)
    end

    def find_user_media
        @user_medium = UserMediumfind(params[:id])
    end
end
