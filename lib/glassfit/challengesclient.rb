require_relative 'glassfitclient'

module Glassfit
  class ChallengesClient < GlassFitClient
    class Challenge < APISmith::Smash
      property :_id
      property :creator_id
      property :type
      property :start_time
      property :stop_time
      property :attempts
    end

    def challenge(id)
      get "challenges/#{id}", :transformer => Challenge
    end
  end
end
