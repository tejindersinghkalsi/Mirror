class Research < ApplicationRecord
    
    belongs_to :user
    
    validates_presence_of :mainheading, :subheading, :contributed, :body
	#Custom scope

	mount_uploader :Image, DocumentUploader

	def self.recent       

		order("created_at DESC")

	end
end
