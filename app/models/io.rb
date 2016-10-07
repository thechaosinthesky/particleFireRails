class Io < ApplicationRecord
	has_and_belongs_to_many :profiles

	validates :name, :io_type, presence: true
end
