class ApplicationController < ActionController::Base
  rescue_from RocketPants::NotFound, :with => :render_404

  @@facebook_app_id = 625999614089605
  @@server_token = nil

  def render_404
    raise ActionController::RoutingError.new('Not Found')
  end
 
  protected

  def user_or_public_access_token
    if current_user.present?
      access_token = current_user.doorkeeper_access_token
    else
      access_token = server_token()
    end
  end

  def server_token
    if @@server_token.nil?
      client = OAuth2::Client.new( CONFIG[:glassfit][:client_id], 
                                   CONFIG[:glassfit][:client_secret], 
                                   :site => CONFIG[:glassfit][:site] )
      @@server_token = client.password.get_token('externalweb@glassfitgames.com', 'testing123')
    end
    if @@server_token.nil?
      raise "Server cannot access API"
    end
    if @@server_token.expired?
      @@server_token.refresh!
    end
    @@server_token.token
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
