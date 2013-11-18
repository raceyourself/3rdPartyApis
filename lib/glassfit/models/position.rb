module Glassfit
  class Position < APISmith::Smash
    property :track_id
    property :state_id
    property :gps_ts
    property :lng
    property :lat
    property :alt
    property :bearing
    property :epe
    property :nmea
  end
end
