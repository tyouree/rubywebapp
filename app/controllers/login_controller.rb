class LoginController < ApplicationController

  # ログイン画面のセッションをリセットする
  protect_from_forgery with: :reset_session

  before_action :logged_in_user, only: [ :index, :destroy ]

  # login page
  def index; end

  def new
    return index
  end

  # check login information
  def auth
    begin
      user_id = params[:login][:user_id]
      user_pw = params[:login][:password]
      # validation
      if !is_alphanumber_hyphen_valid?(user_id) || !is_alphanumberic_symbol_valid?(user_pw)
        # Create an error message.
        raise get_message(Constants::MESSAGE_ERROR_TYPE, 0001, Constants::MESSAGE_CODE_1001)
      end
      user = UserMaster.find_by(user_id: user_id)
      # authentication
      if user #&& user.authenticate(user_pw)
        # Log the user in
        log_in user
        # move to main menu page
        redirect_to(index_path)
      else
        # Create an error message.
        raise get_message(Constants::MESSAGE_ERROR_TYPE, 0001, Constants::MESSAGE_CODE_1002)
      end
    rescue => e
      throw_msg = e.message
      if throw_msg.blank?
        throw_msg = get_message(Constants::MESSAGE_ERROR_TYPE, 0001, Constants::MESSAGE_CODE_1003)
      end
      # Create an error message.
      flash.now[:danger] = throw_msg
      logger.error throw_msg
      # to keep user_id
      @user_id = user_id
      render 'new'
    end
  end

  # log out
  def destroy
    log_out if logged_in?
    redirect_to menu_index_path
  end

  private
  def user_password_params
    params.require(:login).permit(:password, :password_confirmation)
  end
end
