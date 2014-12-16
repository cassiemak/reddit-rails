class CommentsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create]


  # def index
  #   @comments = Comment.all
  # end

  # def new
  #   @comment = Comment.new
  # end

  def create
    post = Post.find(params[:id])

    # comment = current_user.Comment.new(comment_params)
    comment = Comment.new( :user => current_user, :post => post, :message => params[:message])

    if comment.save
      # redirect_to comment.post
      render json: comment, status: 201
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
