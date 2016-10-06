class Profile < ApplicationRecord
	has_and_belongs_to_many :users
	has_and_belongs_to_many :ios

	validates :name, presence: true
end
