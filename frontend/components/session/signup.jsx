'use strict'
const React = require('react');
const Link = require('react-router').Link;
const SessionActions = require('../../actions/session_actions');
const SessionStore = require('../../stores/session_store');
const ErrorStore = require('../../stores/error_store');


const Modal = require("react-modal");

const SignUpForm = React.createClass({

  getInitialState() {
    return {
			username: "",
      email: "",
      password: ""
    };
  },

	handleSubmit(e) {
		e.preventDefault();

		const formData = {
			username: this.state.username,
			email: this.state.email,
			password: this.state.password
		};


    SessionActions.signUp(formData);
	},

  fieldErrors(field) {
    const errors = ErrorStore.formErrors("signup");

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
			<div className="signup-form-container">
				<form onSubmit={this.handleSubmit} className="signup-form-box">

	        { this.fieldErrors("base") }
          <h1 className="signup-header">Sign Up</h1>
					<div className="signup-form">
            <span className="signup-header-caption">It's free and always will be</span>

						<label>
							{ this.fieldErrors("username") }
							<input type="text"
                label='Name'
								value={this.state.username}
								onChange={this.update("username")}
								className="signup-input"
                placeholder="name" />
						</label>

						<label>
		          { this.fieldErrors("email") }
							<input type="text"
		            value={this.state.email}
		            onChange={this.update("email")}
								className="signup-input"
                placeholder="email"
                 />
						</label>


						<label>
		          { this.fieldErrors("password") }
		          <input type="password"
		            value={this.state.password}
                placeholder="password"
		            onChange={this.update("password")}
								className="signup-input" />
						</label>

						<input className="signup-btn" type="submit" value="Sign Up" />
					</div>
				</form>
			</div>
		);
	}
});

module.exports = SignUpForm;
