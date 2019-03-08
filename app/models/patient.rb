class Patient < ApplicationRecord
	has_many :appointments,  dependent: :destroy
	has_many :doctors, :through => :appointments
	has_one_attached :avatar
	
	validates :name, :email, :address , :phoneno , :gender, :dob, :age , :password, presence: true
	validates :email, uniqueness: true
	validates :name, format: { with: /\A[a-zA-Z]+\z/}
	validates :phoneno, length: {in: 7..12}, numericality: { only_integer: true, message: "enter numbers only" }
	validates_format_of :email,:with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i

	attr_accessor :password_confirmation
	validates :password_confirmation, presence: true
	validates :password, confirmation: true

end
