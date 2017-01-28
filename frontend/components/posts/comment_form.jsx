const React = require('react');
const ReactRouter = require('react-router');
const browserHistory = ReactRouter.browserHistory
const SessionStore = require('../../stores/session_store');

const PostActions = require('../../actions/post_actions')

const NewComment = React.createClass({
  getInitialState(){
    return {comment: ""};
  },

  handleSubmit(e){
    e.preventDefault();
    const currentUserId = SessionStore.currentUser().id;
    PostActions.createComment(this.state.comment, currentUserId, this.props.post.id)
    this.setState({comment: ""})
  },

  updateComment(e){
    this.setState({comment: e.target.value});
  },

  render(){
    return (
      <div className='new-comment-form'>
        <form onSubmit={this.handleSubmit}>
          <li className='comment-img-container curr-user'>
            <img src={SessionStore.currentUser().img_url} className='comment-img'/>
          </li>
          <input className='comment-txt' type='text' value={this.state.comment} onChange={this.updateComment} placeholder="Write A Comment..."/>
          <input type='submit' className='comment-submit' value='Add Comment'/>
        </form>
      </div>
    )
  }
})

module.exports = NewComment;
