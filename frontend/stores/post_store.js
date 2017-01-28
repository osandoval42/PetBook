const AppDispatcher = require('../dispatcher/dispatcher.js');
const Store = require('flux/utils').Store;
const PostConstants = require('../constants/post_constants');

const PostStore = new Store(AppDispatcher);

let _wallPosts = {};

let _feedPosts = {};

PostStore.resetPosts = function(){
  _wallPosts = {};
};

PostStore.posts = function(){
  const posts = Object.keys(_wallPosts).map(function(postId){
    return _wallPosts[postId];
  })

  return posts.reverse();
}

PostStore.feedPosts = function(){
  const posts = Object.keys(_feedPosts).map(function(postId){
    return _feedPosts[postId];
  })

  return posts.reverse();
}

PostStore.addPost = function(post){
  _wallPosts[post.id] = post;
  _feedPosts[post.id] = post;
}

PostStore.updatePosts = function(posts){
  PostStore.resetPosts();
  posts.forEach((post) => {
    _wallPosts[post.id] = post;
  })
}


PostStore.updateFeedPosts = function(posts){
  _feedPosts = {};
  posts.forEach((post) => {
    _feedPosts[post.id] = post;
  })
}

PostStore.__onDispatch = function(payload){
  switch(payload.actionType){
    case PostConstants.POSTS:
      PostStore.updatePosts(payload.posts);
      break;
    case PostConstants.NEW_POST:
      PostStore.addPost(payload.post);
      break;
    case PostConstants.FEED_POSTS:
      PostStore.updateFeedPosts(payload.posts)
      break;
  }

  PostStore.__emitChange();
}

module.exports = PostStore;
