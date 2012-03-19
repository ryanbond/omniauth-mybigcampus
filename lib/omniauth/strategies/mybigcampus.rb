require 'omniauth-oauth'
require 'multi_json'

module OmniAuth
  module Strategies
    class Mybigcampus < OmniAuth::Strategies::OAuth2
      option :name, :mybigcampus
      option :client_options, {:authorize_path => '/oauth/authorize',
                               :site => 'http://www.mybigcampus.com'}

      uid { raw_info["id"] }

      info do
        {
          :name => raw_info['full_name'],
          :nickname => raw_info['screen_name'],
          :first_name => raw_info['first_name'],
          :last_name => raw_info['last_name'],
          :email => raw_info['email'],
          :user_type => raw_info['user_type'],
          :urls => {
            :profile => "http://www.mybigcampus.com/users/#{raw_info['screen_name']}",
            :image => "http://www.mybigcampus.com#{raw_info['photo_url_thumb']}"
          }
        }
      end

      def raw_info
        @raw_info ||= access_token.get('/api/v1/credentials/verify.json').parsed
      rescue ::Errno::ETIMEDOUT
        raise ::Timeout::Error
      end

    end
  end
end
