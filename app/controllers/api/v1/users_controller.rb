# frozen_string_literal: true

module Api
  module V1
    class UsersController < ApplicationController

      before_action :set_user, only: %i[show edit update destroy]

      def index
        @users = User.limit(10)
        render json: @users
      end

      def show
        render json: @user
      end

      def new
        @user = User.new
        render json: @user
      end

      def edit; end

      def create
        @user = User.new(user_params)
        if @user.save
          render json: @user
        else
          render json: {status: "error", message: 'User wasn\'t create' }
        end
      end

      def update
        if @user.update(user_params)
          render json: @user
        else
          render json: {status: "error", message: 'User wasn\'t update' }
        end
      end

      def destroy
        if @user.destroy
          render json: { notice: 'User was destroyed' }
        else
          render json: {status: "error", message: 'The user wasn\'t deleted' }
        end
      end

      def login
        @user = User.find_by(:email)
        render json: @user if @user.value?(@user.password)
      end

      private

      def set_user
        @user = User.find(params[:id])
      end

      def user_params

        params.require(:user).permit(:name, :email, :password, :password_digest)         

      end
    end
  end
end
