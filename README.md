# PetBook
[PetBook](https://pets-dot-com.herokuapp.com/)

PetBook is a quick facebook mockup I made while teaching myself Ruby On Rails.  React.js powers the front end and utilizes the Flux cycle for seamless API calls to the Rails backend.  All data is maintained in a PostgreSQL database.  

## Features and Implementation

![](https://github.com/osandoval42/petbook/blob/master/screenshots/facebook_mockup.png "PetBook")

### Friends

`Friendships` is the join table modeling 2 users' friendships.  It contains two foreign key columns, `requestor_id` and `requestee_id`, that join to primary key `id` in `User`.  A third column, `accepted` defines whether a row in this table represents a friendship or merely a friend request.  Thus all friends for a given user's profile can be pulled down by querying all rows in `User` for which `accepted` is true and said user's `id` matches either `requestor_id` or `requestee_id`.  

```Ruby
  def friends
    binds = {id: self.id}

    friend_ids = Friendship.find_by_sql([<<-SQL, binds])
      SELECT
        users.id AS user_id
      FROM friendships f
      JOIN users ON users.id = f.requestor_id
      WHERE f.requestee_id = :id
        AND f.accepted = 'true'
      UNION
      SELECT
        users.id AS user_id
      FROM friendships f
      JOIN users ON users.id = f.requestee_id
      WHERE f.requestor_id = :id
        AND f.accepted = 'true'
    SQL


    friend_ids = friend_ids.map do |friend|
      friend.user_id
    end

    return [] if friend_ids.empty?

    User.where(id: friend_ids)
  end
```
### Comments

In addition to the `body` of content, comments contain a foreign key `user_id` linking to `id` in `User` and a foreign key `post_id` corresponding to `id` in `Post`.  Whenever a new feed is rendered, each relevant post is requested from the backend, in which its comments are nested.  These posts are stored in the `PostStore` until a new feed is rendered or the current session token is destroyed.  

```Ruby
class Api::PostsController < ApplicationController
  def index
    @posts = User.find(params[:user_id]).wall_posts #add include author and photo

    render "api/posts/index"
  end
```
