require 'glassfit/tracksclient'
require 'glassfit/positionsclient'

class TrackController < ApplicationController 

  def show
    @url = request.original_url.split(?).first
    user = current_or_public_user()
    @track = Glassfit::TracksClient.new(user.doorkeeper_access_token).track(params[:id])
  end

end
