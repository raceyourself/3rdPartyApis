require_relative 'glassfitclient'

module Glassfit
  class UsersClient < GlassFitClient
    class User < APISmith::Smash
      property :id
      property :username
      property :email
      property :name
      property :created_at
      property :admin
      property :points
    end

    def users
      get "users", :transformer => User
    end
  end
end
