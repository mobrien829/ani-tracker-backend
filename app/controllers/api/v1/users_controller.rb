class Api::V1::UsersController < ApplicationController

    def index
        render json: @user
    end

    def update
        @user.update(user_params)
        if @user.save
            render json: @user, status: :accepted
        else
            render json: { errors: @user.errors.full_messages },  status: :unprocessible_entity
        end
    end

    def create
        @user = User.create(user_params)
        if @user.save
            render json: @user, status: :accepted
        else
            render json: { errors: @user.errors.full_messages },  status: :unprocessible_entity
        end
    end

    def destroy
        @user.delete
    end


end
