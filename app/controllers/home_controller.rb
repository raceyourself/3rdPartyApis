require 'glassfit/positionsclient'

class HomeController < ApplicationController 

  def positions
    @positions = Glassfit::PositionsClient.new(current_user.doorkeeper_access_token).positions()
  end

end
