'use strict'

const React = require('react');
const SessionStore = require('../../stores/session_store');
const UserStore = require('../../stores/user_store');
const UserActions = require('../../actions/user_actions');
const FriendRequestTab = require('./Tabs/friend_request_tabs');
const SessionActions = require('../../actions/session_actions');

const ReactRouter = require('react-router');
const browserHistory = ReactRouter.browserHistory;
const SearchBar = require('./search_bar');

const LoggedInHeader = React.createClass({
  getInitialState(){
    return {friendRequestDisplay: false, users:[]}
  },

  componentDidMount(){
    this.usersListener = UserStore.addListener(this.setUsers);
    UserActions.fetchAllUsers();
  },

  componentWillUnMount(){
    this.usersListener.remove()
  },

  setUsers(){
    if (UserStore.allUsers().length !== this.state.users.length){
      this.setState({users: UserStore.allUsers()})
    }
  },

  toggleFriendRequests(){
    let toggledState = this.state.friendRequestDisplay ? false : true;
    this.setState({friendRequestDisplay: toggledState});
  },

  handleLogout(){
    SessionActions.logOut();
    this.toHome();
  },

  toHome(){
    browserHistory.push('/');
  },

  toProfile(){
    const currentUserId = SessionStore.currentUser().id;
    browserHistory.push(`/profile/${currentUserId}`);
  },

  render(){
    let friendRequestTab

    if (this.state.friendRequestDisplay === true){
      friendRequestTab = <FriendRequestTab toggleFriendRequests = {this.toggleFriendRequests}/>;
    } else{
      friendRequestTab ='';
    }

    return(
      <header className="logged-in-header">
        <SearchBar users={this.state.users}/>
        {friendRequestTab}

        <div className="header-buttons">
          <a className="header-button" onClick={this.toProfile}> {SessionStore.currentUser().username} </a>
          <div className='header-btn-divider'></div>
          <a className="header-button" onClick={this.toHome}>Home</a>
          <div className='header-btn-divider'></div>
          <a className="header-button" onClick={this.toggleFriendRequests}>Friend Requests</a>
          <div className='header-btn-divider'></div>
          <a className="header-button logout-btn" onClick={this.handleLogout}>Log Out</a>
        </div>

      </header>
    )
  }
})

// <button className="header-button">Messages</button>

module.exports = LoggedInHeader;
