class ApplicationController < ActionController::Base
  @@server_uid = 13
  @@facebook_app_id = 625999614089605
  @@server_user = nil
 
  protected

  def current_or_public_user
    if current_user.present?
      access_token = current_user
    else
      access_token = server_user()
    end
  end

  def server_user
    if @@server_user.nil?
      @@server_user = User.where(doorkeeper_uid: @@server_uid).first
      unless @@server_user.present? && @@server_user.doorkeeper_access_token.present?
        raise "The server's API client does not have an access token. Have an admin initialize the server"
      end
    end
    @@server_user
  end

  def format_timestamp(timestamp)
    Time.at(timestamp/1000).to_datetime
  end
  helper_method :format_timestamp

  def facebook_app_id
    @@facebook_app_id
  end
  helper_method :facebook_app_id

end
