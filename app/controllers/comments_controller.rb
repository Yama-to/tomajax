class CommentsController < ApplicationController
  before_action :set_comment,  only: [:edit, :update, :destroy]
  before_action :get_comments, only: [:index, :edit, :create]

  # GET /comments
  def index
    @comment  = Comment.new
  end

  # GET /comments/1/edit
  def edit
    render :index
  end

  # POST /comments
  def create
    @comment = Comment.new(comment_params)

    respond_to do |format|
      if @comment.save
        format.html { redirect_to comments_url, notice: 'Comment was successfully created.' }
      else
        flash[:danger] = 'Faild to create a comment.'
        format.html { render :index }
      end
    end
  end

  # PATCH/PUT /comments/1
  def update
    respond_to do |format|
      if @comment.update(comment_params)
        format.html { redirect_to comments_url, notice: 'Comment was successfully updated.' }
      else
        flash[:danger] = 'Faild to update a comment.'
        format.html { render :index }
      end
    end
  end

  # DELETE /comments/1
  def destroy
    @comment.destroy
    respond_to do |format|
      format.html { redirect_to comments_url, notice: 'Comment was successfully destroyed.' }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_comment
      @comment = Comment.find(params[:id])
    end

    def get_comments
      @comments = Comment.order(updated_at: :desc)
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def comment_params
      params.require(:comment).permit(:text)
    end
end
