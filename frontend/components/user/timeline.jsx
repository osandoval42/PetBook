const React = require('react');
const SessionStore = require('../../stores/session_store');
const SessionActions = require('../../actions/session_actions');
const PostActions = require('../../actions/post_actions');
const PostStore = require('../../stores/post_store');
const ReactRouter = require('react-router');
const browserHistory = ReactRouter.browserHistory;
const Post = require('../posts/post')


const Timeline = React.createClass({
  getInitialState(){
    return {posts: PostStore.posts(), newPostContent:''}
  },

  componentDidMount(){
    this.postListener = PostStore.addListener(this.populatePosts);
    PostActions.fetchPosts(this.props.profileId);
  },

  componentWillReceiveProps(){
    this.setState({newPostContent:''})
    PostStore.resetPosts();
    PostActions.fetchPosts(this.props.profileId);
  },

  componentWillUnmount(){
    this.postListener.remove();
  },

  populatePosts(){
    this.setState({posts: PostStore.posts()})
  },

  toUserProfile(userId){
    browserHistory.push(`/profile/${userId}`);
  },

  handleSubmit(e){
    e.preventDefault()
    const newPost = this.state.newPostContent;
    const currentUserId = SessionStore.currentUser().id;
    const profileId = this.props.profileId;

    PostActions.submitPost(newPost, currentUserId, profileId);
  },

  updatePostContent(e){
    e.preventDefault()
    let val = e.target.value
    this.setState({newPostContent: val})
  },

  render(){
    let newPost
    if (SessionStore.isUserLoggedIn){
      newPost = (
        <div className='new-post-panel'>
          <form onSubmit={this.handleSubmit}>
          <div className='new-post-content'>
            <input type='text' onChange={this.updatePostContent} value={this.state.newPostContent}
              className='new-post-input' placeholder="Whats on your mind?"/>
          </div>
          <div className='new-post-btn-container'>
            <input type='submit' className='post-btn' value='Post' />
          </div>
          </form>
        </div>
      )
    } else{
      newPost = ''
    }
    return (
      <div className='timeline-tab'>
        {newPost}
        <div className='timeline-posts'>
          <ul>
            {
              this.state.posts.map((post) => {
                return(
                  <Post key={post.id} post={post}/>
                )
              })
            }
          </ul>
        </div>
      </div>
    )
  }
})

module.exports = Timeline
