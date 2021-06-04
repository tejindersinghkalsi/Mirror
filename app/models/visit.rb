class Visit < ApplicationRecord
	belongs_to :user

	validates_uniqueness_of :country
	validates_presence_of :description
	validates_presence_of :schedule
end
