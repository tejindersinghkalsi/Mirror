class Quiz < ApplicationRecord
	has_many :questions, dependent: :destroy
	

	accepts_nested_attributes_for :questions,
	                               allow_destroy: :true, 
	                               reject_if: lambda{ |attrs| attrs['ques'].blank? }

	
end
