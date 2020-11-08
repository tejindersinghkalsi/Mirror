class Research < ApplicationRecord
    
    belongs_to :user
    
    validates_presence_of :mainheading, :subheading, :contributed, :body
	#Custom scope
	def self.recent       

		order("created_at DESC")

	end
end
