# frozen_string_literal: true

module Api
  module V1
    class UsersController < ApplicationController
      before_action :set_user, only: %i[show edit update destroy]
      skip_before_action :verify_authenticity_token

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
        if @user.save!
          render json: 'user created'
        else
          render json: 'post request failed'
        end
      end

      def update
        if @user.update(user_params)
          render json: "#{@user.name} is updated by postman request"
        else
          render json: 'patch request failed'
        end
      end

      def destroy
        @user.destroy
        render json: "#{@user.name} is deleted"
      end

      private

      def set_user
        @user = User.find(params[:id])
      end

      def user_params
        params.require(:user).permit(:name, :role, :email, :password)
      end
    end
  end
end
