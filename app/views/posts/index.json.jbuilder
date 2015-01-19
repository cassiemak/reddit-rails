json.posts @posts do |post|
  json.title post.title
  json.url post.url
  json.link post_path(post)
end