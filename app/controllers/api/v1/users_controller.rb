class Api::V1::UsersController < ApplicationController

    skip_before_action :authenticate_request, only: [:login, :create]
    before_action :find_user, only: [:update, :index]

    # note: to auth lock index to just current user, uncomment line 10 and comment line 11

    def index
        # byebug
        # render json: @user
        render json: User.all
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
        @user = User.new(user_params)
        if @user.save
            # byebug
            render json: @user, status: :accepted
        else
            render json: { errors: @user.errors.full_messages },  status: :unprocessible_entity
        end
    end

    def destroy
        @user.delete
    end

    def login
        authenticate(params[:username], params[:password]) 
    end

    def authenticate(username, password)
        command = AuthenticateUser.call(username, password)
        if command.success?
            render json: {
                access_token: command.result,
                message: 'Login Successful'
            }
        else
            render json: {error: command.errors}, status: :unauthorized
        end
    end

    def user_params
        params.permit(
            :username,
            :password
        )
    end

    def find_user
        @user = current_user
    end
end
