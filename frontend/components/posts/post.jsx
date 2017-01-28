const React = require('react');
const ReactRouter = require('react-router');
const browserHistory = ReactRouter.browserHistory

const NewComment = require('./comment_form');

const SessionStore = require('../../stores/session_store');

const PostActions = require('../../actions/post_actions')

const Post = React.createClass({

  toUserProfile(userId){
    browserHistory.push(`/profile/${userId}`);
  },

  likePost(){
    PostActions.likePost(this.props.post.id, SessionStore.currentUser().id)
  },

  unlikePost(){
    PostActions.unlikePost(this.props.post.id, SessionStore.currentUser().id)
  },

  likeBtn(){
    const likes = this.props.post.likes
    const currentUserId = SessionStore.currentUser().id

    if (likes.some((like) => {
      return like.likerId === currentUserId;
    })){
      return <button className='unlike-btn' onClick={this.unlikePost}><i className="fa fa-thumbs-o-down"></i></button>;
    }
    else{
      return <button className='like-btn' onClick={this.likePost}><i className="fa fa-thumbs-o-up"></i></button>;
    }
  },

  commentForm(){
    if (SessionStore.isUserLoggedIn() !== true){
      return ""
    }

    return (
      <NewComment post={this.props.post}/>
    );
  },

  render(){
    let post = this.props.post;
    let Receiver = ''

    if (post.authorId !== post.wallId &&  this.props.feed === true){
      Receiver = (<span className='enclosing-span'>
                    <span className='to'>&nbsp; <i className='fa fa-arrow-circle-right '></i></span>
                    <span className='receiver-name' onClick={this.toUserProfile.bind(this, post.receiverId)}>
                      &nbsp;{post.receiverName}</span>
                  </span>)
    }

    return(
      <li>
        <div className='post-and-comment-holder'>
          <div className='post-holder'>
            <div className='poster-info'>
              <container className='post-profile-img-container'>
                <img src={post.authorImgUrl}/>
              </container>
              <div className='poster-stuff'><span className='poster-name' onClick={this.toUserProfile.bind(this, post.authorId)}>
                {post.authorName}</span> {Receiver}</div>
            </div>
            <p className='post-body'>
              {post.body}
            </p>
            <div className='post-menu'>
              {this.likeBtn()}
              <span className='like-count'>{this.props.post.likes.length}</span>
            </div>
          </div>
          
          <div className='comment-container'>
            <ul>
                {
                    post.comments.map((comment) => {
                      return (
                      <li key={comment.id} className='comment'>
                        <li className='comment-img-container'>
                          <img src={comment.commentorImg} className='comment-img'/>
                        </li>
                        <span className='commentor-name'
                          onClick={this.toUserProfile.bind(this, comment.commentorId)}>
                          {comment.commentorName}</span>
                        <span className='comment-body'>{comment.body}</span>
                      </li>
                      );
                    })
                }
            </ul>
            {this.commentForm()}
          </div>
        </div>
      </li>
    )
  }
})

module.exports = Post;
