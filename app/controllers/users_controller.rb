class UsersController < ApplicationController
    before_action :authenticate_user, only: [:get_user]

    def create 
        @user = User.new(user_params)
        if @user.save
            auth_token = Knock::AuthToken.new payload: {sub: @user.id}
            render json: {user: @user.filtered_information, jwt: auth_token.token}, status: :created
        else 
            render json: {error: @user.errors}, status: :unprocessable_entity
        end
    end

    def sign_in 
        @user = User.find_by(email: params[:email])
        if @user && @user.authenticate(params[:password])
            auth_token = Knock::AuthToken.new payload: {sub: @user.id}
            render json: {user: @user.filtered_information, jwt: auth_token.token}, status: :created
        else 
            render json: {error: "Incorrect email or password"}, status: 404
        end
    end

    def get_user
        # If the jwt token is legit, send back the user data
        render json: {user: current_user.filtered_information}
        # if @user
        #     render json: {@user.filtered_information}, status: 201
        # else 
        #     render json: {error: "user not found"}, status: 404
        # end

    end

    private 
    def user_params 
        params.permit(:first_name, :last_name, :email, :phone_number, :password, :password_confirmation)
    end
end
