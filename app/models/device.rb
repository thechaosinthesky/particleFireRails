class Device < ApplicationRecord
	belongs_to :user
	has_many :io

	validates :name, :external_id, :user_id, presence: true
end
