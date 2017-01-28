# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)



  User.create({username: 'Biggie', password: 'Biggie', email:'Biggie@yahoo.com', gender: 'Male', breed: 'Pitbull', birthday:"22/07/2012"})
  User.create({username: 'Pugsy', password: 'password', email:'Demo@demo.com', gender: 'Female', breed: 'Pug', birthday:"12/11/2003"})
  User.create({username: 'Jeffrey', password: 'Jeffrey', email:'Jeffrey@gmail.com', gender: 'Male', breed: 'Giraffe', birthday:"01/06/2012"})
  User.create({username: 'Princess', password: 'Princess', email:'Princess@yahoo.com', gender: 'Female', breed: 'Pitbull', birthday:"03/05/2003"})
  User.create({username: 'Markov', password: 'Markov', email:'Markov@yahoo.com', gender: 'Male', breed: 'Cat', birthday:"22/07/2012"})
  User.create({username: 'Kitty', password: 'Kitty1', email:'Kitty@yahoo.com', gender: 'Female', breed: 'Kitten', birthday:"12/12/2014"})
  User.create({username: 'Romeo', password: 'Romeo1', email:'Romeo@yahoo.com', gender: 'Male', breed: 'Cat', birthday:"07/11/2010"})
  User.create({username: 'Juliet', password: 'Juliet', email:'Juliet@yahoo.com', gender: 'Female', breed: 'Cat', birthday:"14/05/2003"})
  User.create({username: 'Batman', password: 'Batman', email:'Batman@yahoo.com', gender: 'Male', breed: 'Ginnypig', birthday:"08/01/2013"})
  User.create({username: 'Chester', password: 'Chester', email:'Chester@yahoo.com', gender: 'Male', breed: 'Dog', birthday:"21/07/2015"})


Photo.create(album_id: 1, profile: true, cover: false, date: Date.today, img_url:'http://www.dogbreedplus.com/dog_breeds/images/American-Pitbull-Terrier-Dog.jpg')
Photo.create(album_id: 2, profile: false, cover: true, date: Date.today, img_url:'http://s8.favim.com/610/150927/cute-dog-family-guaf-Favim.com-3362998.jpg')

Photo.create(album_id: 3, profile: true, cover: false, date: Date.today, img_url:'http://moderndogmagazine.com/sites/default/files/images/uploads/Pug.jpg')
Photo.create(album_id: 4, profile: false, cover: true, date: Date.today, img_url:'http://65.media.tumblr.com/tumblr_m2t9bvr9nh1r4li38o1_1280.jpg')

Photo.create(album_id: 5, profile: true, cover: false, date: Date.today, img_url:'http://www.metalinjection.net/wp-content/uploads/2014/08/Giraffe-Tongue-Orchestra.jpg')
Photo.create(album_id: 6, profile: false, cover: true, date: Date.today, img_url:'http://www.komar.org/faq/travel/vacation/african_safari_family_trip/zimbabwe/2010_06_14_16_03_31_1483-giraffe-zimbabwe.jpg')

Photo.create(album_id: 7, profile: true, cover: false, date: Date.today, img_url: 'http://dogtime.com/assets/uploads/gallery/pit-bull-dog-breed-pictures/pit-bull-dog-breed-picture-10.jpg')
Photo.create(album_id: 8, profile: false, cover: true, date: Date.today, img_url: 'https://img.buzzfeed.com/buzzfeed-static/static/2014-10/20/22/enhanced/webdr09/enhanced-18663-1413859183-12.jpg')

Photo.create(album_id: 9, profile: true, cover: false, date: Date.today, img_url:'https://i.ytimg.com/vi/sfA0tZgtSeg/maxresdefault.jpg')
Photo.create(album_id: 10, profile: false, cover: true, date: Date.today, img_url:'http://absfreepic.com/absolutely_free_photos/small_photos/lovely-cat-family-3264x2448_77013.jpg')

Photo.create(album_id: 11, profile: true, cover: false, date: Date.today, img_url:'https://pbs.twimg.com/profile_images/567285191169687553/7kg_TF4l.jpeg')
Photo.create(album_id: 12, profile: false, cover: true, date: Date.today, img_url:'https://s-media-cache-ak0.pinimg.com/236x/6c/95/d5/6c95d550a21fc6d4f58fa4c61bf36274.jpg')

Photo.create(album_id: 13, profile: true, cover: false, date: Date.today, img_url:'http://www.recipeapart.com/wp-content/uploads/2009/11/cute-cats-wallpaper-5.jpg')
Photo.create(album_id: 14, profile: false, cover: true, date: Date.today, img_url:'http://img.photobucket.com/albums/v623/cran_b/Pets/aussiekittenpacksmall.jpg')

Photo.create(album_id: 15, profile: true, cover: false, date: Date.today, img_url:'http://loyfly.com/wp-content/uploads/2013/02/tabby-cat-1024x768.jpg')
Photo.create(album_id: 16, profile: false, cover: true, date: Date.today, img_url:'http://www.cathub.tv/wp-content/uploads/2014/12/cat-love-cats-in-love.jpg')

Photo.create(album_id: 17, profile: true, cover: false, date: Date.today, img_url:'https://s-media-cache-ak0.pinimg.com/736x/2e/07/5e/2e075e9950b9caf56b020ab679cd0e1a.jpg')
Photo.create(album_id: 18, profile: false, cover: true, date: Date.today, img_url:'http://www.guineapigtoday.com/wp-content/uploads/2012/07/image002.jpg')

Photo.create(album_id: 19, profile: true, cover: false, date: Date.today, img_url:'http://bestpickr.com/wp-content/uploads/Little-Cute-Dog-Lying-Bored.jpg')
Photo.create(album_id: 20, profile: false, cover: true, date: Date.today, img_url:'https://s-media-cache-ak0.pinimg.com/736x/c4/73/2b/c4732b85f02f4e3f07649baa965e44ab.jpg')

Friendship.create(requestor_id: 2, requestee_id: 1, accepted: true)
Friendship.create(requestor_id: 4, requestee_id: 2, accepted: true)
Friendship.create(requestor_id: 2, requestee_id: 5, accepted: true)
Friendship.create(requestor_id: 6, requestee_id: 2, accepted: true)
Friendship.create(requestor_id:2 , requestee_id: 7, accepted: true)
Friendship.create(requestor_id: 3, requestee_id: 2, accepted: false)
Friendship.create(requestor_id: 10, requestee_id: 2, accepted: false)

Friendship.create(requestor_id: 1, requestee_id: 3, accepted: true)
Friendship.create(requestor_id: 6, requestee_id: 10, accepted: true)
Friendship.create(requestor_id: 9, requestee_id: 3, accepted: true)
Friendship.create(requestor_id: 5, requestee_id: 4, accepted: true)
Friendship.create(requestor_id: 7, requestee_id: 8, accepted: true)
Friendship.create(requestor_id: 1, requestee_id: 9, accepted: true)
Friendship.create(requestor_id: 1, requestee_id: 6, accepted: true)
Friendship.create(requestor_id: 8, requestee_id: 7, accepted: true)

Post.create(author_id: 2, wall_id: 4, body:"Hey your kinda cute")
Post.create(author_id: 1, wall_id: 2, body:"Lets go to the park this weekend")
Post.create(author_id: 6, wall_id: 2, body:"MMMEEOOOOWWWWW")
Post.create(author_id: 5, wall_id: 2, body:"Hows life?")
Post.create(author_id: 2, wall_id: 5, body:"Kinda rough, I've been dodging the pound all the week")
Post.create(author_id: 8, wall_id: 7, body:"Hey Bae")
Post.create(author_id: 2, wall_id: 2, body:"Its a dog eat dog world")

PostLike.create(post_id: 7, user_id: 1)
PostLike.create(post_id: 7, user_id: 2)
PostLike.create(post_id: 7, user_id: 4)
PostLike.create(post_id: 2, user_id: 2)

PostComment.create(post_id: 7, user_id: 1, body: "Your tellin me")
PostComment.create(post_id: 7, user_id: 6, body: "Dont be so pessimistic.  Be positive!")
PostComment.create(post_id: 7, user_id: 2, body: "Easy for you to say when your the cutest kitten on the block ;)")
PostComment.create(post_id: 5, user_id: 4, body: "Call your mother!")
