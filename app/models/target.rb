class Target < ApplicationRecord
	has_many :tasks
	belongs_to :user
	accepts_nested_attributes_for :tasks,
	                               allow_destroy: :true, 
	                               reject_if: lambda{ |attrs| attrs['name'].blank? }

	mount_uploader :doc, DocumentUploader

	validates_presence_of :name, :description, :begin, :end
end

