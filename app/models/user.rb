class User < ActiveRecord::Base
  devise :omniauthable

  def self.find_or_create_for_doorkeeper_oauth(oauth_data)
    logger.info oauth_data.to_json
    User.find_or_initialize_by(doorkeeper_uid: oauth_data.uid).tap do |user|
      user.email = oauth_data.info.email
    end
  end

  def update_doorkeeper_credentials(oauth_data)
    self.doorkeeper_access_token = oauth_data.credentials.token
  end
end
