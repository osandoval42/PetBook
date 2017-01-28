const React = require('react');
const Timeline = require('./timeline');
const About = require('./about');
const Friends = require('./friends')

const Main = React.createClass({
  render(){
    let displayed;
    switch(this.props.displayedTab){
      case 'timeline':
        displayed = <Timeline user={this.props.user} profileId={this.props.profileId}
          ownProfile={this.props.ownProfile}/>
        break;
      case 'about':
        displayed = <About user={this.props.user} ownProfile={this.props.ownProfile}/>
        break;
      case 'friends':
        displayed = <Friends user={this.props.user} ownProfile={this.props.ownProfile}/>
        break;
    }

    return (
      <div className='main-profile'>
       {displayed}
      </div>
    )
  }
})

module.exports = Main;
