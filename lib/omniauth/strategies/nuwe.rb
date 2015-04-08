require 'omniauth-oauth2'

module OmniAuth
  module Strategies
    class Nuwe < OmniAuth::Strategies::OAuth2

      option :name, "nuwe"

      # do we need the access_token and request_token paths here as well?
      option :client_options, {
        :site => "https://api.nuwe.co",
        :authorize_url => "https://api.nuapi.co/oauth/authorize"
      }

      uid { raw_info["user"]["id"] }

      # need to decide which user info we want to pass to client initially
      info do
        {
          :last_name => raw_info["profile"]["last_name"],
          :first_name => raw_info["profile"]["first_name"],
          :email => raw_info["user"]["email"],
          :sex => raw_info["profile"]["sex"],
          :birth_date => raw_info["profile"]["birth_date"],
          :activity => raw_info["profile"]["activity"]

        }
      end

      # not sure about this. Are getting the raw info from the user's profile?
      def raw_info
        @raw_info ||= access_token.get('/v3/profile.json').body
      end
    end
  end
end
