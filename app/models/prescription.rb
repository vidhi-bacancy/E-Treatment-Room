class Prescription < ApplicationRecord
  belongs_to :doctor
  #has_paper_trail on: [:update]
  	scope :search, ->(s){ where("disease LIKE ? OR medicines LIKE ? OR dose LIKE ?","%#{s}%","%#{s}%","%#{s}%") }
  def retrive_doctor(id)
		d= Doctor.select("name").where("id=?",id)
	end
end
