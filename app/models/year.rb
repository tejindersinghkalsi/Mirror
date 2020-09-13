class Year < ApplicationRecord

	belongs_to :user

	validates_presence_of :name, :limit
	
	has_many :januaries
	accepts_nested_attributes_for :januaries, 
	allow_destroy: true,
	reject_if: lambda { |attrs| attrs['name'].blank? } #Data validations for the nested model.
	has_many :februaries
	accepts_nested_attributes_for :februaries, 
	allow_destroy: true,
	reject_if: lambda { |attrs| attrs['name'].blank? } #Data validations for the nested model.
	has_many :marches
	accepts_nested_attributes_for :marches, 
	allow_destroy: true,
	reject_if: lambda { |attrs| attrs['name'].blank? } #Data validations for the nested model.


	has_many :aprils
	accepts_nested_attributes_for :aprils, 
	allow_destroy: true,
	reject_if: lambda { |attrs| attrs['name'].blank? } #Data validations for the nested model.
	has_many :mays
	accepts_nested_attributes_for :mays, 
	allow_destroy: true,
	reject_if: lambda { |attrs| attrs['name'].blank? } #Data validations for the nested model.
    has_many :junes
    accepts_nested_attributes_for :junes, 
	allow_destroy: true,
	reject_if: lambda { |attrs| attrs['name'].blank? } #Data validations for the nested model.

	has_many :julies
	accepts_nested_attributes_for :julies, 
	allow_destroy: true,
	reject_if: lambda { |attrs| attrs['name'].blank? } #Data validations for the nested model.
	has_many :augusts
	accepts_nested_attributes_for :augusts, 
	allow_destroy: true,
	reject_if: lambda { |attrs| attrs['name'].blank? } #Data validations for the nested model.
	has_many :septembers
	accepts_nested_attributes_for :septembers, 
	allow_destroy: true,
	reject_if: lambda { |attrs| attrs['name'].blank? } #Data validations for the nested model.

	has_many :octobers
	accepts_nested_attributes_for :octobers, 
	allow_destroy: true,
	reject_if: lambda { |attrs| attrs['name'].blank? } #Data validations for the nested model.
	has_many :novembers
	accepts_nested_attributes_for :novembers, 
	allow_destroy: true,
	reject_if: lambda { |attrs| attrs['name'].blank? } #Data validations for the nested model.
	has_many :decembers
	accepts_nested_attributes_for :decembers, 
	allow_destroy: true,
	reject_if: lambda { |attrs| attrs['name'].blank? } #Data validations for the nested model.

end
