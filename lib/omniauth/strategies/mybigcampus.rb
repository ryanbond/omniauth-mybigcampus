require 'omniauth-oauth'
require 'multi_json'

module OmniAuth
  module Strategies
    class Mybigcampus < OmniAuth::Strategies::OAuth2
      option :name, :mybigcampus
      option :client_options, {:authorize_path => '/oauth/authorize',
                               :site => 'http://api.mybigcampus.com'}

      uid { raw_info["id"] }

      info do
        {
          :screen_name => raw_info['screen_name'],
          :first_name => raw_info['first_name'],
          :last_name => raw_info['last_name'],
          :email => raw_info['email'],
          :urls => {
            :profile => "http://www.mybigcampus.com/users/#{raw_info['screen_name']}",
            :image => "http://www.mybigcampus.com#{raw_info['photo_url_thumb']}"
          }
        }
      end

      def raw_info
        @raw_info ||= access_token.get('/v1/credentials/verify.json').parsed
      rescue ::Errno::ETIMEDOUT
        raise ::Timeout::Error
      end

    end
  end
end
