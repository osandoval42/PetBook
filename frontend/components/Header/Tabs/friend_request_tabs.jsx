"use strict";

const React = require('react');
const FriendStore = require('../../../stores/friend_store')
const SessionStore = require('../../../stores/session_store')
const FriendActions = require('../../../actions/friend_actions')

const ReactRouter = require('react-router');
const browserHistory = ReactRouter.browserHistory;

const FriendRequestTab = React.createClass({
  getInitialState(){
    return {friend_requests: FriendStore.requestingFriends()};
  },

  componentDidMount(){
    this.requestListener = FriendStore.addListener(this.setFriends);
    FriendActions.fetchFriendRequests(SessionStore.currentUser().id);
  },

  componentWillUnmount(){
    this.requestListener.remove();
  },

  setFriends(){
    this.setState({friend_requests: FriendStore.requestingFriends()})
  },

  confirmRequest(userId){
    const requesteeId = SessionStore.currentUser().id;
    FriendActions.confirmRequest(userId, requesteeId);
  },

  rejectRequest(userId){
    const requesteeId = SessionStore.currentUser().id;
    FriendActions.rejectRequest(userId, requesteeId);
  },

  toUserProfile(userId){
    this.props.toggleFriendRequests();
    browserHistory.push(`/profile/${userId}`);
  },

  render(){
    return(
      <div className='friend-request-tab'>
        <div className='friend-request-header'>
          <h6>Friend Requests</h6>
        </div>
        <ul>
          {
            this.state.friend_requests.map((user) => {
              return (
                <li className='friend-request'>
                  <li className='request-img-container'>
                    <img src={user.img_url}/>
                  </li>
                  <div className= 'request-text'>
                    <span className='user-name-in-request'
                      onClick={this.toUserProfile.bind(this, user.id)}>{user.name}</span>
                    <div className='friend-request-buttons'>
                      <button className='request-confirm'
                        onClick={this.confirmRequest.bind(this, user.id)}>Confirm</button>
                      <button className='delete-request'
                        onClick={this.rejectRequest.bind(this, user.id)}>Delete Request</button>
                    </div>
                  </div>
                </li>
              );
            })
          }
        </ul>
      </div>
    );
  }
});

module.exports = FriendRequestTab;
