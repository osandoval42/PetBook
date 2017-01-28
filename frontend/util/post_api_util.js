module.exports = {
  fetchPosts(userId, success){
    $.ajax({
			url:  `/api/users/${userId}/posts`,
			method: 'GET',
			success,
			error: function (xhr) {
			  console.log("Error in FriendApiUser #FetchFriends");
			},
		});
  },
  submitPost(wallId, json, success) {
    $.ajax({
      url: `/api/users/${wallId}/posts`,
      type: 'POST',
      dataType: 'json',
      data: json,
      success,
      error(xhr) {
        console.log('error in submitPost')
      }
    });
  },

  createComment(json, success){
    $.ajax({
      url: `/api/comments`,
      type: 'POST',
      dataType: 'json',
      data: json,
      success,
      error(xhr) {
        console.log('error in submitPost')
      }
    });
  },

  fetchFeedPosts(userId, success){
    $.ajax({
			url:  `/api/users/${userId}/feeds`,
			method: 'GET',
			success,
			error: function (xhr) {
			  console.log("Error in Fetch feed posts");
			},
		});
  },
  likePost(json, success) {
    $.ajax({
      url: `/api/likes`,
      type: 'POST',
      dataType: 'json',
      data: json,
      success,
      error(xhr) {
        console.log('error in likePost')
      }
    });
  },
  unlikePost(json, success) {
    $.ajax({
      url: `/api/likes/1`,
      type: 'DELETE',
      dataType: 'json',
      data: json,
      success,
      error(xhr) {
        console.log('error in likePost')
      }
    });
  }
}
