require_relative 'glassfitclient'
require_relative 'models/position'

module Glassfit
  class TracksClient < GlassFitClient
    class Track < APISmith::Smash
      property :device_id
      property :track_id
      property :track_name
      property :user_id
      property :public
      property :positions, :transformer => Position
    end

    def tracks
      get 'tracks', :transformer => Track
    end

    def track(id)
      get "tracks/#{id}", :transformer => Track
    end
  end
end
