class Topic < ApplicationRecord

	validates_presence_of :category
	has_many :stories
end
