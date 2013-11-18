require 'glassfit/tracksclient'
require 'glassfit/positionsclient'

class TrackController < ApplicationController 

  def show
    @url = request.original_url
    @track = Glassfit::TracksClient.new(current_user.doorkeeper_access_token).track(params[:id])
  end

end
