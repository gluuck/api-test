# frozen_string_literal: true

module Api
  module V1
    class UsersController < ApplicationController

      before_action :set_user, only: %i[show edit update destroy]

      def index
        @users = User.last(10)
        render json: {
          "success": true,
          "message": "Last 10 users",
          "data": {
          "requests": @users}
        }
      end

      def show
        if @user
        render json: {
          "success": true,
          "message": "User id:#{@user.id} ",
          "data": {
            "user": @user
          }
        }
        else
          render json: { 
            "success": false,
            "message": "User wasn't found ",
          }, status: 404 
        end
      end

      def new;end

      def edit; end

      def create
        @user = User.new(user_params)
        if @user.save
          render json: {
          "success": true,
          "message": "User id:#{@user.id} was created ",
          "data": {
            "request": @user
          }
        }
        else
          render json: {
            "success": false,
            "message": "Error user cannot be created",
            "data": @user.errors 
            }, status: 422
        end
      end

      def update
        if @user
          @user.update(user_params)
          render json: {
            "success": true,
            "message": "User id:#{@user.id} was updated",
            "data": {
              "category": @user
            }
          }
        else
          render json: {
            "success": false,
            "message": "Error",
            "data": @user.errors
            }, status: 422
        end
      end

      def destroy
        if @user
          @user.destroy
          render json: { 
            "success": true,
            "message": 'User was destroyed',
            "data": {} 
          }
        else
          render json: {
            "success": false,
            "message": "User wasn't found"
          }, status: 404         
        end
      end

      def login
        @user = User.find_by(email: params[:email])
        
        if @user["password_digest"] == params[:password]
          render json: {status: succes}
        else
          render json: {
            "success": false,
            "message": "User wasn't found"
          }, status: 404
        end
      end

      private

      def set_user
        @user = User.find_by(id: params[:id])
      end

      def user_params
        params.permit(:name, :email,:password)
      end
      
    end
  end
end
