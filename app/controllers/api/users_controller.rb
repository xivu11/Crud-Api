class Api::UsersController < ApplicationController

    def index
        @users=User.all
        render json: @users
    end

    def show
        @user=User.find(params[:id])
        render json:@user
    end

    def create
        @user = User.new(user_params)
        if @user.save
            render json: {message: "User created successfully", data: @user}
        else
            render error: {error: "Unable to create user"}, status: 400
        end
    end

    def update
        @user=User.find(params[:id])
        if @user
            @user.update(user_params)
            render json: {message: "User updated successfully", data: @user}
        else
            render error: {error: "Unable to update user"}
        end
    end

    def destroy
        @user = User.find(params[:id])
        @user.destroy
        render json: {message: "User deleted successfully"}
    end
    
    def typeahead
        @users = User.where('lower(firstName) LIKE ? OR lower(lastName) LIKE ? OR lower(email) LIKE ?',"%#{params[:input]}%","%#{params[:input]}%","%#{params[:input]}%")
        render json: {status:200, data:@users}
    end

    private

    def user_params
        params.require(:user).permit(:firstName, :lastName, :email)
    end
    
end
