class Community < ApplicationRecord

	validates_presence_of :title, :body

	mount_uploader :doc, DocumentUploader
end
