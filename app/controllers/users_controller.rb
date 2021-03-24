class UsersController < ApplicationController
    def new
        @user = User.new
    end

    def edit
        @user = User.find(params[:id])
    end

    def update
        @user = User.find(params[:id])
        if @user.update(user_params)
            flash[:notice] = "Account information was successfully updated"
            redirect_to articles_path

        else
            render 'edit'
        end
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