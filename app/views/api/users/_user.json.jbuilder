json.extract! user, :id, :username, :email, :gender, :breed, :birthday

json.profileAlbumId user.profile_album_id
json.coverAlbumId user.cover_album_id

json.img_url user.profile_pic.img_url

json.friends user.friends do |friend|
  json.id friend.id
  json.name friend.username
end

json.requestsPending user.friend_requests_pending do |potential_friend|
  json.id potential_friend.id
  json.name potential_friend.username
end
