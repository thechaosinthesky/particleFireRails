require 'json'

class Io < ApplicationRecord
	has_and_belongs_to_many :profiles
	belongs_to :device

	validates :name, :io_type, presence: true

	def settings_json
		JSON.parse(self.settings)
	end
end
