class Task < ApplicationRecord
	belongs_to :target

	validates :point,numericality: {less_than_or_equal_to: 10}
	validates :progress,numericality: {less_than_or_equal_to: 100}
end
