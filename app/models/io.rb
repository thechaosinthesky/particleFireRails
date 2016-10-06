class Io < ApplicationRecord
	has_and_belongs_to_many :profiles

	validates :name, :type, presence: true
end
