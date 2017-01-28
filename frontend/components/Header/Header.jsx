"use strict";

const React = require('react');
const SessionStore = require('../../stores/session_store');
const LoggedInHeader = require('./logged_in_header');
const LoginHeader = require('../session/login_header');

const Header = React.createClass({
  render(){
    if (SessionStore.isUserLoggedIn()){
      return(
        <LoggedInHeader user={ SessionStore.currentUser() }/>
      );
    } else{
      return(
        <LoginHeader />
      );
    }
  }
});

module.exports = Header;
