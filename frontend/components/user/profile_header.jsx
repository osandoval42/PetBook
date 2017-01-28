'use strict'

const React = require('react');
const SessionStore = require('../../stores/session_store');
const SessionActions = require('../../actions/session_actions');

const UserStore = require('../../stores/user_store');
const UserActions = require('../../actions/user_actions');
const PhotoActions = require('../../actions/photo_actions');
const FriendActions = require('../../actions/friend_actions');


//need a add friend vs friend button contingent on user logged in and based on friends

//REMEMBER we have props ownProfile and user
const ProfileHeader = React.createClass({
  getInitialState(){
    return {requestMade: false};
  },

  changeProfilePhoto(){
    cloudinary.openUploadWidget(cloudinary_options, (err, collection) => {
       if (err === null){
         this.sendProfilePhoto(collection[0].url);
       }
       else{
         return "error"
       }
    })
  },

  sendProfilePhoto(photo_url){
    PhotoActions.createPhoto(this.props.user.id, this.props.user.profileAlbumId, photo_url);
  },

  requestFriend(){
    FriendActions.requestFriend(SessionStore.currentUser().id, this.props.user.id);
    this.setState({requestMade: true});
  },

  changeCoverPhoto(){
    cloudinary.openUploadWidget(cloudinary_options, (err, collection) => {
       if (err === null){
         this.sendCoverPhoto(collection[0].url);
       }
       else{
         return "error"
       }
    })
  },


  friendButton(){
   const currentUser = SessionStore.currentUser();

   if (this.state.requestMade === true){
     return (<div className='friend-btn-container'>
              <button className='friend-request-btn'>Pending</button>
             </div>);
   }

    if (currentUser.id === undefined ||
      currentUser.id === this.props.user.id){
      return '';
    }

    if (currentUser.friends.some((friend) => {
      return friend.id === this.props.user.id;
    })){
      return (<div className='friend-btn-container'>
               <button className='friend-request-btn'>Friends</button>
              </div>);
    } else{

          if (currentUser.requestsPending.some((user) => {
            return user.id === this.props.user.id;
          })){
            return (<div className='friend-btn-container'>
                     <button className='friend-request-btn'>Pending</button>
                    </div>);
          } else{
            return (<div className='friend-btn-container'>
                   <button className='add-friend-btn' onClick={this.requestFriend}>Add Friend</button>
                 </div>);
          }
    }
  },

  sendCoverPhoto(photo_url){
    PhotoActions.createPhoto(this.props.user.id, this.props.user.coverAlbumId, photo_url);
  },

  render(){
    let profilePhotoBtn = <div></div>;
    let coverPhotoBtn = <div></div>;
    if (this.props.ownProfile === true){
      profilePhotoBtn = <i className="fa fa-camera profile-photo-btn" onClick={this.changeProfilePhoto}></i>;
      coverPhotoBtn = <i className="fa fa-camera cover-photo-btn" onClick={this.changeCoverPhoto}></i>;
    }
    //make this.props.user.profilePic !== undefined  ? our pic else a black image
    return (
      <header className="profile-header">
        <container className="profile-photo-container">
          <img className='profile-pic' src={this.props.user.profilePic} />
          {profilePhotoBtn}
        </container>

        <container className="cover-photo-container" >
          <img className='cover-photo' src={this.props.user.coverPhoto} />
        </container>
        {coverPhotoBtn}
        {this.friendButton()}
        <span className='user-profile-name'>{this.props.user.name}</span>
      </header>
    );
  }
})

module.exports = ProfileHeader;
