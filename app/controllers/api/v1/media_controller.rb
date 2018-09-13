class Api::V1::MediaController < ApplicationController
    skip_before_action :authenticate_request, only: [:login, :create]
    before_action :find_medium, only: [:update]

    def index
        @media = Medium.all
        render json: @media
    end

    def update
        @medium.update(medium_params)
        if @medium.save
            render json: @medium, status: :accepted
        else
            render json: {errors: @medium.errors.full_messages}, status: :unprocessible_entity
        end
    end

    def create
        @medium = Medium.find_or_create_by(medium_params)
        if @medium.save
            render json: @medium, status: :accepted
        else
            render json: {errors: @medium.errors.full_messages}, status: :unprocessible_entity
        end
    end

    def destroy
        @medium.delete
    end

    def medium_params
        params.permit(:id, :malId, :title, :description, :coverImgString, :genres, :bannerImgString)
    end

    def find_medium
        @medium = Medium.find(params[:id])
    end
end
