class CommentsController < ApplicationController
  before_action :set_comment,  only: [:edit, :update, :destroy]
  before_action :get_comments

  def index
    @comment  = Comment.new
  end

  def edit
  end

  def create
    @comment = Comment.create(comment_params)
  end

  def update
    @comment.update(comment_params)
    @comment = Comment.new
  end

  def destroy
    @comment.destroy
  end

  private
    def set_comment
      @comment = Comment.find(params[:id])
    end

    def get_comments
      @comments = Comment.order(updated_at: :desc)
    end

    def comment_params
      params.require(:comment).permit(:text, :id)
    end
end
