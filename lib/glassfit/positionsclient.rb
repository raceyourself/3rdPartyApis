require_relative 'glassfitclient'
require_relative 'models/position'

module Glassfit
  class PositionsClient < GlassFitClient
    def positions
      get 'positions', :transformer => Position
    end
  end
end
