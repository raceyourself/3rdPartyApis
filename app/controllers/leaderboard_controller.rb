require 'glassfit/usersclient'

class LeaderboardController < ApplicationController 

  def index
    @users = Glassfit::UsersClient.new(user_or_public_access_token()).users()
  end

end
