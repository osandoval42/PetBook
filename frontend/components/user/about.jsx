const React = require('react');
const SessionStore = require('../../stores/session_store');
const SessionActions = require('../../actions/session_actions');
const UserStore = require('../../stores/user_store');


const About = React.createClass({

  breed(){
    if (this.props.user.breed !== null){
      return <div className='info-div'><span>Identifies as a {this.props.user.breed}</span></div>;
    } else{
      return "";
    }
  },

  gender(){
    if (this.props.user.gender !== null){
      return <div className='info-div'><span>{this.props.user.gender}</span></div>;
    } else{
      return "";
    }
  },

  birthday(){
    if (this.props.user.birthday !== null){
      return <div className='info-div'><span>Born on {this.props.user.birthday}</span></div>;
    } else{
      return "";
    }
  },

  render(){
    return (
      <div className='profile-tab'>
        <div className='profile-nav-header'>
          <h2>About</h2>
        </div>
        <div className='profile-nav-display'>
            <span className='profile-nav-name'>{this.props.user.name}</span>
            {this.gender()}
            {this.breed()}
            {this.birthday()}
        </div>
      </div>
    )
  }
})

module.exports = About
