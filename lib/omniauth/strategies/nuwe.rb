require "omniauth-oauth2"

module OmniAuth
  module Strategies
    class Nuwe < OmniAuth::Strategies::OAuth2

      option :name, "nuwe"

      option :client_options, {
        :site => "https://developer.nuwe.co",
        :authorize_url => "https://developer.nuwe.co/oauth/authorize",
        :token_url => "https://developer.nuwe.co/oauth/token"
      }

      uid { raw_info["user"]["id"] }

      info do
        {
          :last_name => raw_info["user"]["profile"]["last_name"],
          :first_name => raw_info["user"]["profile"]["first_name"],
          :email => raw_info["user"]["email"],
          :sex => raw_info["user"]["profile"]["sex"],
          :birth_date => raw_info["user"]["profile"]["birth_date"],
          :activity => raw_info["user"]["profile"]["activity"]

        }
      end

      def raw_info
        @raw_info ||= access_token.get("/v3/profile.json").parsed
      end
    end
  end
end
