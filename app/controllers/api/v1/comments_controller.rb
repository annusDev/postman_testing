# frozen_string_literal: true

module Api
  module V1
    class CommentsController < ApplicationController
      before_action :set_comment, only: %i[show edit update destroy]

      def index
        @comments = Comment.all
        render json: @comments
      end

      def show
        render json: @comment
      end

      def new
        @post = Post.find(params[:post_id])
        @comment = Comment.new
        render json: @comment
      end

      def edit
        render json: @comment
      end

      def create
        @comment = Comment.new(comment_params)
        if @comment.save
          render json: "comment with id: #{@comment.id} is created"
        else
          render json: 'post request failed'
        end
      end

      def update
        if @comment.update(comment_params)
          render json: "comment with id: #{@comment.id} is updated"
        else
          render json: 'put/patch request failed'
        end
      end

      def destroy
        @comment.destroy
        render json: "comment with id: #{@comment.id} is deleted"
      end

      private

      def set_comment
        @comment = Comment.find(params[:id])
      end

      def comment_params
        params.require(:comment).permit(:content, :user_id, :post_id)
      end
    end
  end
end
