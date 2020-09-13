class Story < ApplicationRecord
	belongs_to :topic
	belongs_to :user
	has_many :comments, dependent: :destroy
	is_impressionable

	validates_presence_of :title, :body, :topic_id

	#Custom scope
	def self.recent       

		order("created_at DESC")

	end
end
