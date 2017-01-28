class Api::SessionsController < ApplicationController

	def create
    capitalize_email

		@user = User.find_by_credentials(
      params[:user][:email],
      params[:user][:password]
    )

    if @user
			login(@user)
			render "api/users/show"
		else
			render(
        json: {
          base: ["Invalid email/password combination"]
        },
        status: 401
      )
		end
	end

	def destroy
		@user = current_user
		if @user
			logout
			render json: {}
		else
			render(
        json: {
          base: ["Nobody signed in"]
        },
        status: 404
      )
		end
	end

  private

	def capitalize_email
    params[:user][:email] = params[:user][:email].capitalize unless params[:user][:email].nil?
	end
end
