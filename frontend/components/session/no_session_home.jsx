"use strict";
const LogInHeader = require('./login_header');
const SignUp = require('./signup');
const React = require('react');
const SessionActions = require('../../actions/session_actions');
const SessionStore = require('../../stores/session_store');
const ErrorStore = require('../../stores/error_store');

const ReactRouter = require('react-router');
const browserHistory = ReactRouter.browserHistory;


const Modal = require("react-modal");

const NewSessionForm = React.createClass({


	componentDidMount() {
    this.errorListener = ErrorStore.addListener(this.forceUpdate.bind(this));
    this.sessionListener = SessionStore.addListener(this.redirectIfLoggedIn);
  },

  componentWillUnmount() {
    this.errorListener.remove();
    this.sessionListener.remove();
  },




	redirectIfLoggedIn() {
	  if (SessionStore.isUserLoggedIn()) {
	      browserHistory.push("/");
	  }
	},

	render() {

		return (
	   <div className="noSessionPage">
			 <LogInHeader />
			 <SignUp />
	   </div>
	  );
	}
});

module.exports = NewSessionForm;
