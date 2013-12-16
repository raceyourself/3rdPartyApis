require 'glassfit/challengesclient'

class ChallengeController < ApplicationController 

  def show
    @challenge = Glassfit::ChallengesClient.new(user_or_public_access_token()).challenge(params[:id])
    @challenger_id = params[:from]
    @taunt = params[:taunt]
    if @challenger_id
      render 'directed'
    else
      render 'public'
    end
  end

end
