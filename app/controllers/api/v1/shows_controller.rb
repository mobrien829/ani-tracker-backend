class Api::V1::ShowsController < ApplicationController
    skip_before_action :authenticate_request, only: [:create]
    before_action :find_show, only: [:update]

    def index
        @shows = Show.all
        render json: @shows
    end

    def update
        @show.update(show_params)
        if @show.save
            render json: @show, status: :accepted
        else
            render json: {errors: @show.errors.full_messages}, status: :unprocessible_entity
        end
    end

    def create
        @show = Show.find_or_create_by(show_params)
        if @show.save
            render json: @show, status: :accepted
        else
            render json: {errors: @show.errors.full_messages}, status: :unprocessible_entity
        end
    end

    def destroy
        @show.delete
    end

    def show_params
        params.require(:show).permit(:id, :malId, :title, :description, :coverImgString, :genres, :bannerImgString)
    end

    def find_show
        @show = Show.find(params[:id])
    end
end
