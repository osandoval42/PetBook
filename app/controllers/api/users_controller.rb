class Api::UsersController < ApplicationController

  def index
    @users = User.all

		render 'api/users/index'
	end

	def create
		@user = User.new(user_params)
    capitalize_user_params

		if @user.save
			login(@user)
			render "api/users/show"
		else
			render json: @user.errors, status: 422
		end
	end

	def show
    @user = User.find_by_id(params[:id]);

	  unless @user.nil?
      render "api/users/show_profile"
	  else
      render json: {message: "User with said Id does not exists"},
			status: 422
	  end
	end

	def update
    @user = User.find_by_id(params[:id]);
    updating_params = user_params
		capitalize_user_params(updating_params);

		type_convert_date(updating_params)
		if @user.update(updating_params)
      render "api/users/show"
		else
			render json: {message: "Failed to update"},
		  status: 422
		end
	end

	private

	def capitalize_user_params(updating_params = nil)
		if (updating_params.nil?)
		  @user.username = @user.username.capitalize unless @user.username.nil?
	  	@user.gender = @user.gender.capitalize unless @user.gender.nil?
			@user.breed = @user.breed.capitalize unless @user.breed.nil?
			@user.email = @user.email.capitalize unless @user.email.nil?
		else

			updating_params[:username] = updating_params[:username].capitalize unless updating_params[:username].nil?
	  	updating_params[:gender] = updating_params[:gender].capitalize unless updating_params[:gender].nil?
			updating_params[:breed] = updating_params[:breed].capitalize unless updating_params[:breed].nil?
			updating_params[:email] = updating_params[:email].capitalize unless updating_params[:email].nil?
    end
	end

  def user_params
    params.require(:user).permit(:username, :password, :email, :birthday, :breed, :gender)
  end

	def type_convert_date(updating_params)
		 date = updating_params[:birthday]
     unless date.nil?
        newDate = calendar_date_to_date_type(date)
				updating_params[:birthday] = newDate
		 end
	end

	def calendar_date_to_date_type(calendar_date)
    calendar_arr = calendar_date.split('-')
		date_type_arr = [];
    3.times do |i|
       date_type_arr[2 - i] = calendar_arr[i]
		end

    date_type_arr[0] = pad_zero(date_type_arr[0])
    date_type_arr[1] = pad_zero(date_type_arr[1])

		date_type_arr.join('/')
	end

	def pad_zero(numStr)
    numStr = "#{0.to_s}#{numStr}" if numStr.length == 1

		numStr
	end

end
