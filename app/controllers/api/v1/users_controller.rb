module Api
  module V1
    class UsersController < ApplicationController
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
        
      end

      def create
      end

      def update
      end

      def destroy
      end

      private
      def set_user
        @user = User.find(params[:id])
      end
    end
  end  
end

