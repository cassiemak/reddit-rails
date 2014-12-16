class PostVotesController < ApplicationController
  # ignore authenticity token
  # skip_before_filter :verify_authenticity_token

  before_action :authenticate_user!, only: [:create]

  def create
    # finds the post, given an url with right format
    # '/post_votes/:id'
    post = Post.find(params[:id])

    new_vote = PostVote.new( :user => current_user, :post => post)
    # new_vote = PostVote.new (:user_id => current_user.id, :post_id => post.id)

    # key => value

    if new_vote.save
      # this single line already did the view for us
      render json: new_vote, status: 201
      # http://httpstatus.es/

    end
  end
end
