# frozen_string_literal: true

require "auth0"
require "faraday"
require "jwt"

module Devise
  module Auth0
    # Helpers to parse token from a request and to a response
    class Token
      def self.parse(auth)
        token = new(auth)
        token.verify
        token
      end

      def initialize(auth)
        @auth = auth.presence
      end

      def user_id
        return if verify.nil?

        verify[0]["sub"]
      end

      def user
        @user ||= if verify[0]["gty"] == "client-credentials"
          {
            "user_id" => user_id,
            "email" => "#{verify[0]["sub"]}.#{config.domain}",
          }
        else
          client.user(user_id)
        end
      end

      def verify
        @payload ||= JWT.decode(@auth, nil,
          true, # Verify the signature of this token
          algorithms: config.algorithm,
          iss: "https://#{config.domain}/",
          verify_iss: true,
          aud: config.aud,
          verify_aud: true) do |header|
          jwks_hash[header["kid"]]
        end
      rescue JWT::DecodeError
        nil
      end

      def valid?
        !verify.nil?
      end

      private

      def config
        ::Devise::Auth0.config
      end

      def client
        @auth0_client ||= Auth0Client.new(
          client_id: config.client_id,
          client_secret: config.client_secret,
          domain: config.domain
        )
      end

      def jwks_hash
        conn = ::Faraday.new("https://#{config.domain}") do |f|
          f.request(:retry, max: 3)
        end
        jwks_keys = JSON.parse(conn.get("/.well-known/jwks.json").body)["keys"]
        Hash[
          jwks_keys
            .map do |k|
            [
              k["kid"],
              OpenSSL::X509::Certificate.new(
                Base64.decode64(k["x5c"].first)
              ).public_key,
            ]
          end
        ]
      end
    end
  end
end