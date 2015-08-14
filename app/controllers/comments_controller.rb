class CommentsController < ApplicationController
  before_action :set_comment,  only: [:edit, :update, :destroy]
  before_action :get_comments

  def index
    @comment  = Comment.new
  end

  def edit
    render :index
  end

  def create
    @comment = Comment.new(comment_params)
    if @comment.save
      redirect_to comments_url, notice: 'Comment was successfully created.'
    else
      flash[:danger] = 'Faild to create a comment.'
      render :index
    end
  end

  def update
    if @comment.update(comment_params)
      redirect_to comments_url, notice: 'Comment was successfully updated.'
    else
      flash[:danger] = 'Faild to update a comment.'
      render :index
    end
  end

  def destroy
    @comment.destroy
    redirect_to comments_url, notice: 'Comment was successfully destroyed.'
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
