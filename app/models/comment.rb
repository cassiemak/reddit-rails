class Comment < ActiveRecord::Base
  belongs_to :user
  belongs_to :post

  validates :message, :presence => true 
  # :length => { maximum: 140}

  # allow_blank false doesn't work
  # validates :message, :allow_blank => false

  # min length 1 doesn't work because you can enter with space
  # validates :message, :length => {minimum :1}

end
