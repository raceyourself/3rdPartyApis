module OmniAuth
  module Strategies
    class GlassfitDoorkeeper < OmniAuth::Strategies::OAuth2
      option :name, :glassfit_doorkeeper

      option :client_options, {
        :site => "http://glassfit.dannyhawkins.co.uk/",
        :authorize_path => "/oauth/authorize"
      }

      uid do
        raw_info["id"]
      end

      info do
        {
          :email => raw_info["email"]
        }
      end

      def raw_info
        @raw_info ||= access_token.get('/api/1/me').parsed
      end

      def build_access_token
        headers = {
          :headers => {
            'Authorization' => "Bearer #{client.secret}"
          }
        }
        verifier = request.params['code']
        client.auth_code.get_token(verifier, {:redirect_uri => callback_url}.merge(token_params.to_hash(:symbolize_keys => true)).merge(headers))
      end
    end
  end
end
