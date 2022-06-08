# frozen_string_literal: true

module Api
  module V1
    class PostsController < ApplicationController
      before_action :set_post, only: %i[ edit update destroy ]
      # before_action :authenticate_user!

      def index
        @posts = Post.all
        render json: @posts
      end

      def show
        @post = Post.includes(:comments).find(params[:id])
        render json: @post
      end

      def new
        @post = Post.new
        render json: @post
      end

      def edit
        render json: @post
      end

      def create
        @post = Post.new(post_params)
        if @post.save
          render json: 'post request for posts_controller'
        else
          render json: 'post request failed'
        end
      end

      def update
        if @post.update(post_params)
          render json: 'put/patch request for update controller'
        else
          render json: 'failed put/patch request'
        end
      end

      def destroy
        @post.destroy
        render json: 'delete request for destroy conrtroller'
      end

      private

      def set_post
        @post = Post.find(params[:id])
      end

      def post_params
        params.require(:post).permit(:title, :content, :user_id)
      end
    end
  end
end
