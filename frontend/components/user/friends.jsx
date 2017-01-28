const React = require('react');
const SessionStore = require('../../stores/session_store');
const SessionActions = require('../../actions/session_actions');
const FriendStore = require('../../stores/friend_store');
const FriendActions = require('../../actions/friend_actions');
const ReactRouter = require('react-router');
const browserHistory = ReactRouter.browserHistory;



const Friends = React.createClass({
  getInitialState(){
    return {friends: []};
  },

  componentDidMount(){
    this.friendListener = FriendStore.addListener(this.populateFriends);

    FriendActions.fetchFriends(this.props.user.id);
  },

  componentWillUnmount(){
    this.friendListener.remove();
  },

  componentWillReceiveProps(){
    FriendActions.fetchFriends(this.props.user.id);
  },

  populateFriends(){
    const fetchedFriends = FriendStore.friends();
    this.setState({friends: fetchedFriends});
  },

  changeProfile(id){
    browserHistory.push(`/profile/${id}`);
  },

  render(){
    return (
      <div className='profile-tab'>
        <div className='profile-nav-header'>
          <h2>Friends</h2>
        </div>
        <div className='profile-nav-display'>

          <ul>
            {
              this.state.friends.map((friend) => {
                return (<li key={friend.email} className='friend-display'>
                    <div className='actual-friend-display'>
                      <div className='friend-photo-container'>
                        <img onClick={this.changeProfile.bind(this, friend.id)}
                          className='friend-img' src={friend.img_url} />
                      </div>
                      <a onClick={this.changeProfile.bind(this, friend.id)} className='friend-title'>
                        {friend.name}
                      </a>
                    </div>
                  </li>);
              })
            }
          </ul>
        </div>
      </div>
    )
  }
})

module.exports = Friends
