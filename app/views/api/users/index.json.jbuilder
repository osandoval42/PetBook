json.array! @users do |user|
  json.name user.username
  json.id user.id
  json.img_url user.profile_pic.img_url
end
