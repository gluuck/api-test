module Api
  module V1
    class UsersController < ApplicationController
      before_action :set_user, only: %i[show edit update destroy]

      def index
        @users = User.all
        render json: @users
      end

      def show
        render json: @user
      end

      def new
        @user = User.new
        render json: @user
      end

      def edit
        render json: @user
      end

      def create
        @user = User.new(user_params)
        if @user.save
          render json: @user
        else
          render json: @user.errors, status: :unprocessable_entity 
        end
      end

      def update
        if @user.update(user_params)
          render json: @user
        else
          render json: @user.errors, status: :unprocessable_entity 
        end
      end

      def destroy
        @user.destroy
        render json[:notice]='User was destroyed' 
      end

      def login
        @user = User.find_by(:email)
        render json: { success: true } if @user.value?(@user.password)
      end
      private
      def set_user
        @user = User.find(params[:id])
      end

      def user_params
        params.fetch(:user,{}).permit(:name, :email,:password)
      end
    end
  end  
end

