class UsersController < ApplicationController

    def index
      render json: User.all
    end

    def show
      render json: User.find(params[:id])
    end

    def create
      user = User.new(user_perms)
      if user.save
        render json: user
      else
        render(
          json: user.errors.full_messages, status: :unprocessable_entity
        )
      end
    end

    def update
      user = User.find(params[:id])
      user.update_attributes(user_perms)
      render json: user
    end

    def destory
      user = User.find(params[:id])
      user.destroy
      render json: user

    end

    private

    def user_perms
      params.require(:user).permit(:name, :email)
    end
end
