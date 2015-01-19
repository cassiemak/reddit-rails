class PostsController < ApplicationController
    # we are going to check the following conditions before we do anything in this controller
    before_action :authenticate_user!, only: [:new, :create]
    # or, does the same thing, only something, means except something else
    before_action :authenticate_user!, except: [:index, :show]

    # authenticate_user is povided by Devise, again Devise a library (gem) in Ruby

    # shows all the posts
    def index
      #how do i get data here
      @posts = Post.all
      # render :json
    end

# creating form for user to submit new posts
    def new
      @cat = Post.new
    end

# sending the entry to the table
    def create
      # post_params is define below
      post = current_user.posts.new(post_params)
      if post.save
          redirect_to posts_path
      else
        flash[:message] = post.errors.messages
        
        redirect_to :back
      end
    end

# this only shows 1 post
    def show
      # parama [:id] will look for the id in the URL

      # this basically retrieve the post with a specific id
      @post = Post.find(params[:id])
      @comment = Comment.new
    end

# this is only for internal use
# def means I am defining a function. 
# a function can also be called as a 'method' or an 'action'
    private
      def post_params
          params.require(:post).permit(:title, :url)
    end


end
3