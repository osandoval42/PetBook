const AppDispatcher = require('../dispatcher/dispatcher');
const ReactRouter = require('react-router');
const UserConstants = require('../constants/user_constants');
const ApiUtil = require('../util/user_api_util');
const PhotoUtil = require('../util/photo_api_util');
const SessionActions = require('./session_actions');
const browserHistory = ReactRouter.browserHistory;



const UserActions = {
  resetProfileUser(){
    AppDispatcher.dispatch({
      actionType: UserConstants.RESET_PROFILE_USER
    })
  },

  fetchUser(id){
    ApiUtil.fetchUser(id, this.receiveProfileUser)
  },

  receiveProfileUser(user){
    AppDispatcher.dispatch({
      actionType: UserConstants.NEW_PROFILE_USER,
      user: user
    })
  },

  updateUser(id, form_data){
    const json = {user: form_data};
    ApiUtil.updateUser(id, json, SessionActions.receiveCurrentUser);
  },

  fetchAllUsers(){
    ApiUtil.fetchAllUsers(this.receiveAllUsers)
  },

  receiveAllUsers(allUsers){
    AppDispatcher.dispatch({
      actionType: UserConstants.ALL_USERS,
      users: allUsers
    })
  }

};

module.exports = UserActions;
