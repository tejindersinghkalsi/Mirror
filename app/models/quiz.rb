class Quiz < ApplicationRecord
	has_many :questions, dependent: :destroy
	has_many :keys, dependent: :destroy
	
	validates_presence_of :name, :students, :result, :time, :schedule

	accepts_nested_attributes_for :questions,
	                               allow_destroy: :true, 
	                               reject_if: lambda{ |attrs| attrs['ques'].blank? }

	accepts_nested_attributes_for :keys,
	                               allow_destroy: :true, 
	                               reject_if: lambda{ |attrs| attrs['answer'].blank? }

	
end
