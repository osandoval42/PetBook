"use strict";

const AppDispatcher = require('../dispatcher/dispatcher');
const SessionConstants = require('../constants/session_constants');
const SessionApiUtil = require('../util/session_api_util');
const ErrorActions = require('./error_actions');
const ReactRouter = require('react-router');
const browserHistory = ReactRouter.browserHistory;

const SessionActions = {

  signUp(formData){
    SessionApiUtil.signUp(
      formData,
      SessionActions.receiveCurrentFirstTimeUser,
      ErrorActions.setErrors);
  },

  logIn(formData){
    SessionApiUtil.logIn(
      formData,
      SessionActions.receiveCurrentUser,
      ErrorActions.setErrors);
  },

  logOut() {
    SessionApiUtil.logOut(SessionActions.removeCurrentUser);

  },

  fetchCurrentUser(complete){
    SessionApiUtil.fetchCurrentUser(
      SessionActions.receiveCurrentUser, complete);
  },

  receiveCurrentUser(currentUser) {
    AppDispatcher.dispatch({
      actionType: SessionConstants.LOGIN,
      currentUser: currentUser,
      firstTime: false
    });
  },

  receiveCurrentFirstTimeUser(currentUser){
    AppDispatcher.dispatch({
      actionType: SessionConstants.LOGIN,
      currentUser: currentUser,
      firstTime: true
    });
  },

  removeCurrentUser() {
    AppDispatcher.dispatch({
      actionType: SessionConstants.LOGOUT
    });
    browserHistory.push("/");
  }

};

module.exports = SessionActions;
