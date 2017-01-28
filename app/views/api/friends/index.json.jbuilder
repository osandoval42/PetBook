json.array! @friends do |friend|
  json.id friend.id
  json.email friend.email
  json.name friend.username
  json.img_url friend.profile_pic.img_url
end
