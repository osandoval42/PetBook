json.array! @posts do |post|
  json.authorName post.author.username
  json.authorImgUrl post.author.profile_pic.img_url
  json.receiverName post.wall.username
  json.receiverId post.wall_id
  json.authorId post.author.id
  json.body post.body
  json.id post.id
  json.likes post.likers do |liker|
    json.likerName liker.username
    json.likerId liker.id
  end
  json.comments post.comments do |comment|
    json.body comment.body
    json.commentorName comment.user.username
    json.commentorId comment.user_id
    json.commentorImg comment.user.profile_pic.img_url
    json.id comment.id
  end
end
