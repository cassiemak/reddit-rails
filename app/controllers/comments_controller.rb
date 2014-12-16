class CommentsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create]


  def index
    @comments = Comment.all
  end

  def new
    @comment = Comment.new
  end

  def create
    comment = current_user.comments.new(comment_params)
    if comment.save
      redirect_to comment.post
    else
      redirect_to :back
    end
  end

  def show
    @comment = Comment.find(params[:id])
  end

  private
    def comment_params
      params.require(:comment).permit(:message, :post_id)
    end

end
