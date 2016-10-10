module Particle
  require 'oauth2'
  require 'rest-client'
    
  class Base
    include ActiveModel::Model

    def client
        @@client ||= OAuth2::Client.new(ENV['PARTICLE_API_CLIENT_ID'], ENV['PARTICLE_API_CLIENT_SECRET'], :site => 'https://api.particle.io')

        # @@client ||= OAuth2Client::Client.new('https://api.particle.io', 'particle-fire-5095', '7384a131ec07a0bb30bbeb9e3c49fa01ee92a591', {:token_path => '/oauth/token'})
    end

    def token
      @@token ||= client.client_credentials.get_token
      if @@token.expired?
        @@token.refresh!
      end

      @@token.token


        # @@token ||= JSON.parse(client.client_credentials.get_token.body)["access_token"]
    end

  end
end