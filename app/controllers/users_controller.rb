class UsersController < ApplicationController
  # Use Knock to make sure the current_user is authenticated before completing request.
  before_action :authenticate_user,  only: [:index, :current, :update]
  # before_action :authorize,          only: [:update]

  # Should work if the current_user is authenticated.
  def index
    render json: {status: 200, msg: 'Logged-in'}
  end

  # Method to create a new user using the safe params we setup.
  def create
    user = User.new(user_params)
    if user.save
      render json: {status: 200, msg: 'User was created.'}
    end
  end

  def me
    render json: current_user
  end

  # Method to update a specific user. User will need to be authorized.
  def update
    user = User.find(params[:id])
    if user.update(user_params)
      render json: { status: 200, msg: 'User details have been updated.' }
    else
      render json: user.errors
    end
  end

  # Method to delete a user, this method is only for admin accounts.
  def destroy
    user = User.find(params[:id])
    if user.destroy
      render json: { status: 200, msg: 'User has been deleted.' }
    end
  end

  def start_verification
    request = Authy::PhoneVerification.start(country_code:91, phone_number:current_user.email, via:"sms")
    render json: request.to_json
  end

  # Set is verified to true in users table
  def check_verification
    request = Authy::PhoneVerification.check(verification_code:params[:verification_code], country_code:91, phone_number:current_user.email)
      if request.success?
      current_user.update(is_verified:true)
      end
    render json: request.to_json
  end

  # Call this method to check if the user is logged-in.
  # If the user is logged-in we will return the user's information.
  def current
    current_user.update!(last_login: Time.now)
    render json: current_user
  end

  private

  # Setting up strict parameters for when we add account creation.
  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation, :name)
  end

  # Adding a method to check if current_user can update itself.
  # This uses our UserModel method.
  def authorize
    return_unauthorized unless current_user && current_user.can_modify_user?(params[:id])
  end
end
