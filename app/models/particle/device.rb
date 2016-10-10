require 'rest-client'
require 'json'

module Particle
  class Device < Particle::Base
  	attr_accessor :external_id, :settings

  	def get_status
		response = self.send(self.settings["statusFunction"], { "arg": self.settings["statusPin"] })

# p "HI"
# p response["return_value"] == 1
# p response["return_value"].to_i == 1

		status = !(response && response["return_value"] && response["return_value"] == 1)
  		{io_status: status}
  	end

  	def trigger(action)
		response = self.send(action, { "arg": self.settings["statusPin"] })
  	end

  	def send(action, args)
  		response = RestClient.post("https://api.particle.io/v1/devices/#{self.external_id}/#{action}", 
  			args, 
  			{"Authorization": "Bearer " + token })
		response_json = JSON.parse(response.body)
  	end

  end
end
