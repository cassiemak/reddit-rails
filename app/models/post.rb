class Post < ActiveRecord::Base
  
  belongs_to :user
  has_many :comments
  has_many :post_votes

  # validates :column_name,

  
  URL_REGEX = /https?:\/\/[\S]+/

  validates :title, :length => {minimum: 1, maximum: 100}
  validates :url, :length => {minimum: 1, maximum: 100}

  validates :title, :length => { maximum: 100}, :presence => true
  validates :url, :length => {maximum: 100}, :allow_blank => true, :format => {with: URL_REGEX}

  validate :spam_free

  validate :only_twenty_posts_can_ever_be_created


  private

  def spam_free
    # order all the post reverse chrooloigically
    # the lastest post
    # get the posted time for the latest post
    # latest_time = Post.order("created_at DESC").first.created_at
    last_post = Post.order(:created_at).last

    # last_post = Post.order(:created_at).latest
    # lastest_time = last_post.created_at

    # goal is the user can only post after 1 min
    if Post.any? and last_post.created_at > 1.minute.ago
      # if this is true, the last post was made in less than 1 min
      # ago, sp please raise an error
      # raise "Cannot post within 1 min"
      # instead of using raise
      self.errors.add(:base, "Cannot Post Within 1 minute")
    end
  end

  def only_twenty_posts_can_ever_be_created
    num_post = Post.count 

    if num_post > 4
      # raise "Cannot post more than 20 posts"
      self.errors.add(:base, "Cannot post anymore")
    end
  end

end
