'use strict'
const AppDispatcher = require('../dispatcher/dispatcher');
const ReactRouter = require('react-router');
const PostConstants = require('../constants/post_constants');
const ApiUtil = require('../util/post_api_util');

const PostActions = {
  fetchPosts(userId){
    ApiUtil.fetchPosts(userId, this.receivePosts);
  },

  receivePosts(posts){
    AppDispatcher.dispatch({
      actionType: PostConstants.POSTS,
      posts: posts
    });
  },

  receivePost(post){
    AppDispatcher.dispatch({
      actionType: PostConstants.NEW_POST,
      post: post
    });
  },

  submitPost(post, authorId, wallId){
    const json = {
      post: {
        body: post,
        author_id: authorId
      }
    }
    ApiUtil.submitPost(wallId, json, this.receivePost);
  },

  fetchFeedPosts(userId){
    ApiUtil.fetchFeedPosts(userId, this.receiveFeedPosts)
  },

  receiveFeedPosts(posts){
    AppDispatcher.dispatch({
      actionType: PostConstants.FEED_POSTS,
      posts: posts
    });
  },

  likePost(postId, likerId){
    const json = {
      like: {
          post_id: postId,
          user_id: likerId
      }
    }
    ApiUtil.likePost(json, this.receivePost)
  },

  unlikePost(postId, likerId){
    const json = {
      like: {
          post_id: postId,
          user_id: likerId
      }
    }
    ApiUtil.unlikePost(json, this.receivePost)
  },

  createComment(body, commentorId, postId){
    const json = {
      comment: {
        post_id: postId,
        user_id: commentorId,
        body: body
      }
    }

    ApiUtil.createComment(json, this.receivePost)
  }

};

module.exports = PostActions
