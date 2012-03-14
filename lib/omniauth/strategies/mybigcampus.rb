require 'omniauth-oauth'
require 'multi_json'

module OmniAuth
  module Strategies
    class Mybigcampus < OmniAuth::Strategies::OAuth
      option :name, 'mybigcampus'
      option :client_options, {:authorize_path => '/oauth/authenticate',
                               :site => 'https://api.mybigcampus.com'}

      uid { access_token.params[:user_id] }

      info do
        {
          :nickname => raw_info['screen_name'],
          :first_name => raw_info['first_name'],
          :last_name => raw_info['last_name'],
          :image => raw_info['profile_image_url'],
          :urls => {
            'Website' => raw_info['url'],
            'MyBigCampus' => 'http://www.mybigcampus.com/users/' + raw_info['screen_name'],
          }
        }
      end

      extra do
        { :raw_info => raw_info }
      end

      def raw_info
        @raw_info ||= MultiJson.decode(access_token.get('/v1/users/verify_credentials.json').body)
      rescue ::Errno::ETIMEDOUT
        raise ::Timeout::Error
      end

      alias :old_request_phase :request_phase

      def request_phase 
        screen_name = session['omniauth.params']['screen_name']
        if screen_name && !screen_name.empty?
          options[:authorize_params] ||= {}
          options[:authorize_params].merge!(:force_login => 'true', :screen_name => screen_name)
        end
        old_request_phase
      end


    end
  end
end
