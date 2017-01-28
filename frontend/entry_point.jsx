"use strict";

//React
const React = require('react');
const ReactDOM = require('react-dom');
//Router


//Components
const App = require('./components/App');
const NoSessionHome = require('./components/session/no_session_home');
//Auth
const SessionStore = require('./stores/session_store');
const SessionActions = require('./actions/session_actions');

const Home = require('./components/home');
const Profile = require('./components/user/profile')

const Modal = require("react-modal");
const ReactRouter = require('react-router');
const browserHistory = ReactRouter.browserHistory;
const Router = ReactRouter.Router;
const Route = ReactRouter.Route;
const IndexRoute = ReactRouter.IndexRoute;
const hashHistory = ReactRouter.hashHistory;


const appRouter = (
  <Router history={ browserHistory } >
    <Route path="/" component={ App } >
      <IndexRoute component={ Home}/>
      <Route path="profile/:userId" component={ Profile} />
    </Route>
  </Router>
)


//onEnter={_ensureLoggedIn}

//<Route path="my_profile" component={MyProfile} />

function _ensureLoggedIn(nextState, replace) {
  // We don't want users to be able to visit our 'new' or 'review' routes
  // if they haven't already signed in/up. Let's redirect them!
  // `replace` is like a redirect. It replaces the current entry
  // into the history (and the hashFragment), so the Router is forced
  // to re-route.
    if (!SessionStore.isUserLoggedIn()) {
      replace('/');
    }
    //can I say browserHistory.push
}

document.addEventListener('DOMContentLoaded', function() {
  if (window.currentUser) {
    SessionActions.receiveCurrentUser(window.currentUser);
  }
  Modal.setAppElement(document.body);
  const root = document.getElementById('content');
  ReactDOM.render(appRouter, root);
});
