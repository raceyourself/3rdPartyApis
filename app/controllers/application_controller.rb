class ApplicationController < ActionController::Base
  @@facebook_app_id = 625999614089605

  protected

  def format_timestamp(timestamp)
    Time.at(timestamp/1000).to_datetime
  end
  helper_method :format_timestamp

  def facebook_app_id
    @@facebook_app_id
  end
  helper_method :facebook_app_id

end
