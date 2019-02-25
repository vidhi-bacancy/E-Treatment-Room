class DateValidator < ActiveModel::EachValidator
  def validate_each(appointment,date,value)
    unless value >= Date.today
    appointment.errors[date] << (options[:message] || "is invalid")
    end
  end
end
class Appointment < ApplicationRecord
  belongs_to :patient
  belongs_to :doctor
  validates :date, date: true
  validates :date, presence: true
  LIST = Doctor.all.collect {|c| [ c.name, c.id ]}

  def viewpatient(id)
	d = Doctor.select("name").where("id=?", id)
	d
  end  

  def test(id)
	d = Patient.select("name").where("id=?", id)
	d
  end
end
