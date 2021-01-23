class Story < ApplicationRecord
	belongs_to :topic
	belongs_to :user
	has_many :comments, dependent: :destroy
	is_impressionable :counter_cache => true

	validates_presence_of :title, :body, :topic_id
    
    mount_uploader :Attachment, DocumentUploader
    mount_uploader :Img, DocumentUploader
	#Custom scope
	def self.recent       

		order("created_at DESC")

	end
end
