"use strict";

const React = require('react');

const NoSessionHome = require('./session/no_session_home.jsx');
const Feed = require('./feed/feed.jsx');
const SessionStore = require('../stores/session_store');

const Home = React.createClass({
  componentDidMount(){
    this.justSignedUpListener  = SessionStore.addListener(this.checkJustSignedUp)
  },

  componentWillUnmount(){
    this.justSignedUpListener.remove();
  },

  getInitialState(){
    return {newUser: SessionStore.justSignedUp()};
  },

  checkJustSignedUp(){
    this.setState({newUser: SessionStore.justSignedUp()})
  },

  render(){
    let Index;
    if (SessionStore.isUserLoggedIn())
      return (
        <Feed newUser = {this.state.newUser}/>
      )
    else {
      return(
        <NoSessionHome />
      )
    }

  }
})

module.exports = Home;
