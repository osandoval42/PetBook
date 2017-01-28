json.extract! @user, :id, :email, :gender, :breed, :birthday
json.name @user.username

json.profilePic @user.profile_pic.img_url
json.coverPhoto @user.cover_photo.img_url

json.profileAlbumId @user.profile_album_id
json.coverAlbumId @user.cover_album_id

json.newPhoto @new_photo
