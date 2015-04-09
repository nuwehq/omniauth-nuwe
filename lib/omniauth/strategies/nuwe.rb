require "omniauth-oauth2"

module OmniAuth
  module Strategies
    class Nuwe < OmniAuth::Strategies::OAuth2

      option :name, "nuwe"

      option :client_options, {
        :site => "https://api.nuwe.co",
        :authorize_url => "https://api.nuapi.co/oauth/authorize",
        :token_url => "https://api.nuapi.co/oauth/token"
      }

      uid { raw_info["user"]["id"] }

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

      def raw_info
        @raw_info ||= access_token.get("/v3/profile.json").parsed
      end
    end
  end
end
