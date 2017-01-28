'use strict'
const React = require('react');
const Link = require('react-router').Link;
const SessionActions = require('../../actions/session_actions');
const SessionStore = require('../../stores/session_store');
const ErrorStore = require('../../stores/error_store');



const Modal = require("react-modal");

const LoginHeader = React.createClass({

	DEMO_EMAIL: "Demo@demo.com",

	DEMO_PASSWORD: "password",

	demoLoginHandler(e) {
		e.preventDefault();
		this.setState({ email: "", password: ""});
		var _email = this.DEMO_EMAIL.split("").slice();
		this.fillDemoEmail(_email);
	},

	fillDemoEmail: function(_email) {
	 var self = this;
	 if (_email.length > 0) {
		 setTimeout(function() {
			 self.setState({
				 email: self.state.email + _email.shift()
			 });
			 self.fillDemoEmail(_email);
		 }, 120);
	 } else {
		 var _password = this.DEMO_PASSWORD.split("").slice();
		 this.fillDemoPassword(_password);
	 }
 },

 fillDemoPassword: function(_password) {
	 var self = this;
	 if (_password.length > 0) {
		 setTimeout(function() {
			 self.setState({
				 password: self.state.password + _password.shift()
			 });

			 self.fillDemoPassword(_password);
		 }, 120);
	 } else {
		 var e = { preventDefault: function() {} };
		 this.handleDemoSubmit(e);
	 }
 },

 handleDemoSubmit(e) {
	 e.preventDefault();

	 const formData = {
		 email: this.state.email,
		 password: this.state.password
	 };

		SessionActions.logIn(formData);
 },

  getInitialState() {
    return {
      email: "",
      password: ""
    };
  },


	handleSubmit(e) {
		e.preventDefault();

		const formData = {
			email: this.state.email,
			password: this.state.password
		};


    SessionActions.logIn(formData);
	},

  fieldErrors(field) {
    const errors = ErrorStore.formErrors("login");

    if (!errors[field]) { return; }

    const messages = errors[field].map( (errorMsg, i) => {
      return <li key={ i }>{ errorMsg }</li>;
    });

    return <ul>{ messages }</ul>;
  },

  update(property) {
    return (e) => this.setState({[property]: e.target.value});
  },


	render() {
		return (
			<header className="login-form-container">
				<form onSubmit={this.handleSubmit} className="login-form-box">

	        { this.fieldErrors("base") }
					<div className="login-form">

						<div className="login-inputs-w-labels">

								<div className='input-w-label'>
								{ this.fieldErrors("email") }

									<label for="login-input"> Email 	</label>
									<input type="text"
										value={this.state.email}
										onChange={this.update("email")}
										className="login-input" id="login-input" />
								</div>

	              <div className="input-w-label">
									{ this.fieldErrors("password") }

									<label for="login-password-input"> Password 	</label>
									<input type="password"
										value={this.state.password}
										onChange={this.update("password")}
										className="login-input" id="login-password-input" />
								</div>

								  <input type="submit" value="Log In" className="login-submit" />

									<button id="demo-login-btn" className="demo-submit-btn"	onClick={this.demoLoginHandler}>
										Demo Login
									</button>

							</div>


						</div>

				</form>
			</header>
		);
	}
});

module.exports = LoginHeader;
