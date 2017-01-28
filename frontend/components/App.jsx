"use strict";

const React = require('react');
const Link = require('react-router').Link;
const SessionStore = require('../stores/session_store');
const SessionActions = require('../actions/session_actions');
const NoSessionHome = require('./session/no_session_home.jsx');



const App = React.createClass({

  componentDidMount() {
    SessionStore.addListener(this.forceUpdate.bind(this));
  },

  render() {
    return (
      <div className="App">
        {this.props.children}
      </div>
    );
  }
});

module.exports = App;
