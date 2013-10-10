require_relative 'glassfitclient'

class PositionsClient < GlassFitClient
  class Position < APISmith::Smash
    property :track_id
    property :state_id
    property :ts
    property :lng
    property :lat
    property :alt
    property :bearing
    property :epe
    property :nmea
  end

  def positions
    get 'positions', :transformer => Position
  end
end
