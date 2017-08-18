class UsersController < ApplicationController

    def index
        @user = current_user
        @ideas = Idea.order("likes_count DESC")
    end

    def create
        user = User.new(user_params)
        if (user.valid?)
            user.save
            flash[:notice] = ["User successfully created. Please log in."]
            redirect_to '/'
        else
            flash[:notice] = user.errors.full_messages
            redirect_to '/'
        end
    end

    def show
        @user = User.find(params[:id])
    end

    private
        def user_params
            params.require(:user).permit(:name, :alias, :email, :password, :password_confirmation)
        end
end
