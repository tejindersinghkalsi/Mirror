class Itenary < ApplicationRecord

    has_many :subitenaries, dependent: :destroy
	accepts_nested_attributes_for :subitenaries,
	                               allow_destroy: :true, 
	                               reject_if: lambda{ |attrs| attrs['activity'].blank? }

	validates_presence_of :start, :planname, :related

end
