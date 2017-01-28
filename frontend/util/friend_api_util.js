module.exports = {
  fetchFriends(userId, success){
    $.ajax({
			url:  `/api/users/${userId}/friends`,
			method: 'GET',
			success,
			error: function (xhr) {
			  console.log("Error in FriendApiUser #FetchFriends");
			},
		});
  },

  fetchFriendRequests(userId, success){
    $.ajax({
      url:  `/api/users/${userId}/friend_requests`,
      method: 'GET',
      success,
      error: function (xhr) {
        console.log("Error in FriendApiUser #FetchFriends");
      },
    });
  },

  requestFriend(data, success){
    $.ajax({
      url:  `/api/friends`,
      method: 'POST',
      success,
      data: data,
      error: function (xhr) {
        console.log("Error in FriendsApiUtil #requestFriend");
      },
    });
  },

  confirmRequest(requestorId, requesteeId, success){
    $.ajax({
      url:  `/api/users/${requesteeId}/friend_requests/1`,
      method: 'PATCH',
      success,
      data: {
        requestor: {
          requestor_id: requestorId
        }
      },
      error: function (xhr) {
        console.log("Error in FriendsApiUtil #confirmRequest");
      },
    });
  },

  rejectRequest(requestorId, requesteeId, success){
    $.ajax({
      url:  `/api/users/${requesteeId}/friend_requests/1`,
      method: 'DELETE',
      success,
      data: {
        requestor: {
          requestor_id: requestorId
        }
      },
      error: function (xhr) {
        console.log("Error in FriendsApiUtil #destroyRequest");
      },
    });
  }
}
