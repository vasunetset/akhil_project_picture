class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  mount_uploader :image, ImageUploader
  # require 'file_size_validator' 

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable        
  attr_accessor :login

  has_many :posts 
        

  validates_integrity_of :image
  validates_processing_of :image
  validates_presence_of :username, :image
  validates_uniqueness_of :username

  validate :image_size_validation, :if => "image?"

  def image_size_validation
    if image.size > 2.megabytes
      errors.add(:image_size, "Image shoulds be less than 2Mb.")
    end  
  end 

  def self.find_first_by_auth_conditions(warden_conditions)
    conditions = warden_conditions.dup
    if login = conditions.delete(:login)
    where(conditions).where(["username = :value OR 
                              lower(email) = lower(:value)", 
                              {value: login}]).first
    else
      where(conditions).first
    end  
  end
end
