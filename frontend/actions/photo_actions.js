const AppDispatcher = require('../dispatcher/dispatcher');
const ReactRouter = require('react-router');
const browserHistory = ReactRouter.browserHistory;
const UserConstants = require('../constants/user_constants');
const ApiUtil = require('../util/photo_api_util');
const SessionActions = require('./session_actions');
const UserActions = require('./user_actions');

const PhotoActions = {
  createPhoto(userId, albumId, photo_url){  //look to change
    const json = {
      pic: {
        img_url: photo_url
      }
    };

    ApiUtil.createPhoto(userId, albumId, json, UserActions.receiveProfileUser)
  }
}


module.exports = PhotoActions;
