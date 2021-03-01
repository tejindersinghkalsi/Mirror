class Tutorial < ApplicationRecord

mount_uploader :doc, DocumentUploader
validates_presence_of :name, :function, :command, :area, :description, :title
is_impressionable

end
