class Estimate < ApplicationRecord
	
	has_many :tours, dependent: :destroy
	belongs_to :year

	validates_presence_of :name, :description, :year_id

	accepts_nested_attributes_for :tours,
	                               allow_destroy: :true, 
	                               reject_if: lambda{ |attrs| attrs['name'].blank? }


end
