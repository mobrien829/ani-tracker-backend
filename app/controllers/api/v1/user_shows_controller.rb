class Api::V1::UserShowsController < ApplicationController
    skip_before_action :authenticate_request, only: [:login, :create]
    before_action :find_user_shows, only: [:update]

    def index
        @user_shows = UserShow.all
        render json: @user_shows
    end

    def update
        @user_show.update(user_media_params)
        if @user_show.save
            render json: @user_show, status: :accepted
        else
            render json: {errors: @user_show.errors.full_messages}, status: :unprocessible_entity
        end
    end

    def create
        @user_show = UserShow.find_or_create_by(user_show_params)
        if @user_show.save
            render json: @user_show, status: :accepted
        else
            render json: {errors: @user_show.errors.full_messages}, status: :unprocessible_entity
        end
    end

    def destroy
        @user_show.delete
    end

    private

    def user_show_params
        params.permit(:user_id, :show_id)
    end

    def find_user_shows
        @user_show = UserShow.find(params[:id])
    end
end
