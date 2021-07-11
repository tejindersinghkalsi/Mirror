class User < ApplicationRecord
  ############################################################################################
  ## PeterGate Roles                                                                        ##
  ## The :user role is added by default and shouldn't be included in this list.             ##
  ## The :root_admin can access any page regardless of access settings. Use with caution!   ##
  ## The multiple option can be set to true if you need users to have multiple roles.       ##
  petergate(roles: [:site_admin], multiple: false)                                          ##
  ############################################################################################ 
 

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable,  and :omniauthable
  devise :database_authenticatable,
         :recoverable, :rememberable, :validatable, :trackable

  mount_uploader :headingimg, DocumentUploader
  
  validates_presence_of :name
  validates_presence_of :email
  validates_uniqueness_of :email

  has_many :comments, dependent: :destroy
  has_many :targets, dependent: :destroy
  has_many :years, dependent: :destroy
  has_many :stories, dependent: :destroy
  has_many :feedbacks, dependent: :destroy
  has_many :researches, dependent: :destroy
  has_many :bookmarks, dependent: :destroy
  has_many :visits, dependent: :destroy

  acts_as_messageable

  accepts_nested_attributes_for :bookmarks,
                                 allow_destroy: :true, 
                                 reject_if: lambda{ |attrs| attrs['bname'].blank? }


 accepts_nested_attributes_for :visits,
                                 allow_destroy: :true, 
                                 reject_if: lambda{ |attrs| attrs['country'].blank? }


  #Returning any kind of identification you want for the model
  def display_name
  self.name
  end

  #Returning the email address of the model if an email should be sent for this object (Message or Notification).
  #If no mail has to be sent, return nil.
  def mailboxer_email(object)
  #Check if an email should be sent for that object
  #if true
  self.email
  #if false
  #return nil
  end
  
  def first_name
  	self.name.split.first       # Split is a method in ruby that splits a string and create an array of the values. 
  end

  def last_name
  	self.name.split.first 
  end 
end
