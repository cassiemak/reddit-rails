json.comment do 
  json.message @comment.message
  json.user do 
    @comment.user
  end
  json.link comment_path(comment)

end
