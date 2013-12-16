require 'glassfit/tracksclient'
require 'glassfit/positionsclient'

class TrackController < ApplicationController 

  def show
    @url = request.original_url.split("?").first
    @track = Glassfit::TracksClient.new(user_or_public_access_token()).track(params[:id])
  end

end
