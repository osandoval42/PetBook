
module.exports = {
  fetchUser(id, success){
    $.ajax({
			url:  `/api/users/${id}`,
			method: 'GET',
			success,
			error: function (xhr) {
			  console.log("Error in UserApiUtil #FetchUser");
			},
		});
  },

  fetchAllUsers(success){
    $.ajax({
      url:  `/api/users`,
      method: 'GET',
      success,
      error: function (xhr) {
        console.log("Error in UserApiUtil #FetchAllUsers");
      },
    });
  },

  updateUser(id, data, success){
    $.ajax({
      url:  `/api/users/${id}`,
      method: 'PATCH',
      success,
      data: data,
      error: function (xhr) {
        console.log("Error in UserApiUtil #updateUser");
      },
    });
  }
};
