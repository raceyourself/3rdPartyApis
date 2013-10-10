class GlassFitClient < RocketPants::Client
  version 1
  base_uri 'http://glassfit.dannyhawkins.co.uk/api/'

  def initialize(access_token)
    @access_token = access_token
  end

  def base_request_options
      {:headers => {'Authorization' => "Bearer " + @access_token}}
  end
end
