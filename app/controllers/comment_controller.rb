class CommentController < ApplicationController
  def new
    @comment = Comment.all
    @comment = Comment.new
  end

  def create
    @comment = Comment.new(text: params[:comment][:text])
  end
