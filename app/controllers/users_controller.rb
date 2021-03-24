class UsersController < ApplicationController
    def new
        @user = User.new
    end

    def create
        @user = User.new(user_params)

        if @user.save
            name = @user.username
            flash[:notice] = "Welcome, #{name}, to your Alpha Blog account"
            redirect_to articles_path

        else
            render 'new'
        end
    end


    private 
    def user_params
        params.require(:user).permit(:username, :email, :password)
    end
end