require File.expand_path('lib/glassfit/positionsclient', Rails.root)

class HomeController < ApplicationController 

  def positions
    @positions = PositionsClient.new(current_user.doorkeeper_access_token).positions()
  end

end
