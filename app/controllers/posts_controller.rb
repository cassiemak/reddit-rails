class PostsController < ApplicationController
    def index
      #how do i get data here
      @posts = Post.all
    end

# creating form for user to submit new posts
    def new
      @cat = Post.new
    end

# sending the entry to the table
    def create
      # post_params is define below
      post = Post.new(post_params)
      if post.save
          redirect_to posts_path
      end
    end

# this only shows 1 post
    def show
      # parama [:id] will look for the id in the URL

      # this basically retrieve the post with a specific id
      @post = Post.find(params[:id])
    end

# this is only for internal use
# def means I am defining a function. 
# a function can also be called as a 'method' or an 'action'
    private
      def post_params
          params.require(:post).permit(:title, :url)
    end

    private
      def comment_params
          params.require(:comment).permit(:user, :message)
      end
end
