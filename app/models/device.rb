class Device < ApplicationRecord
	belongs_to :user

	validates :name, :external_id, :user_id, presence: true
end
