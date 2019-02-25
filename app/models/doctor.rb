class Doctor < ApplicationRecord
	has_many :appointments,  dependent: :destroy
	has_many :patients, :through => :appointments

	has_many :prescriptions, dependent: :destroy
	
	validates :name, :email, :specialist, :experience , :clinicaddress, :cliniccno, :password, presence: true
	validates :email, uniqueness: true
	validates :name, format: { with: /\A[a-zA-Z]+\z/}
	validates :cliniccno, length: {in: 7..12}, numericality: { only_integer: true, message: "enter numbers only" }
	validates_format_of :email,:with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i

	attr_accessor :password_confirmation
	validates :password_confirmation, presence: true
	validates :password, confirmation: true

	DOCLIST = Doctor.all.collect {|c| [ c.id , c.name , c.email , c.specialist , c.experience , c.clinicaddress , c.cliniccno ]}
	
end