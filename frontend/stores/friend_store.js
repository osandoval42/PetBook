"use strict";

const AppDispatcher = require('../dispatcher/dispatcher.js');
const Store = require('flux/utils').Store;
const FriendConstants = require('../constants/friend_constants');

const FriendStore = new Store(AppDispatcher);

let _friends = {};

let _requestingFriends= {};

FriendStore.friends = function(){
  const friends = Object.keys(_friends).map(function(friendId){
    return _friends[friendId]
  })

  return friends;
}

FriendStore.requestingFriends = function(){
  const requestingFriends = Object.keys(_requestingFriends).map(function(friendId){
    return _requestingFriends[friendId]
  })

  return requestingFriends;
}

FriendStore.resetFriends = function(){
  _friends = {};
}

FriendStore.resetRequestingFriends = function(){
  _requestingFriends = {};
}

FriendStore.deleteFriendRequest = function(friendId){
  delete _requestingFriends[friendId]
}

FriendStore.storeFriends = function(friends){
  FriendStore.resetFriends()

  friends.forEach((friend) => {
    _friends[friend.id] = friend;
  })
}

FriendStore.storeFriendRequests = function(friends){
  FriendStore.resetRequestingFriends()

  friends.forEach((friend) => {
    _requestingFriends[friend.id] = friend;
  })
}

FriendStore.__onDispatch = function(payload){
  switch(payload.actionType){
    case FriendConstants.FRIENDS_OF_USER:
      FriendStore.storeFriends(payload.friends);
      break;
    case FriendConstants.FRIEND_REQUESTS:
      FriendStore.storeFriendRequests(payload.friends)
      break;
    case FriendConstants.NEW_FRIEND:
      FriendStore.deleteFriendRequest(payload.newFriendId)
      break;
  }

  FriendStore.__emitChange();
}

module.exports = FriendStore
